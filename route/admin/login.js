const express=require('express');
const common=require('../../libs/common');
const mysql=require('mysql');
var db=mysql.createPool({host: 'localhost', user: 'root', password: 'root', database: 'web'});
module.exports=function (){
  var router=express.Router();
  router.get('/', (req, res)=>{
    res.render('admin/login.ejs', {});
  });
  router.post('/', (req, res)=>{
    var username=req.body.username;
    var password=common.md5(req.body.password+common.MD5_SUFFIX);
    db.query(`SELECT * FROM admin_table WHERE username='${username}'`, (err, data)=>{
      if(err){
        console.error(err);
        res.status(500).send('database error').end();
      }else{
        if(data.length==0){
          res.status(400).send('no this admin').end();
        }else{
          if(data[0].password==password){
            //成功
            req.session['admin_id']=data[0].ID;
            res.redirect('/admin/');
          }else{
            res.status(400).send('this password is incorrect').end();
          }
        }
      }
    });
  });
  return router;
};
