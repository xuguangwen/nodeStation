const express=require('express');
const mysql=require('mysql');
var db=mysql.createPool({host: 'localhost', user: 'root', password: 'root', database: 'web'});
module.exports=function (){
  var router=express.Router();
  router.get('/', (req, res)=>{
    res.render('zhuce/register.ejs', {});
  });
  router.post('/', (req, res)=>{
    var username=req.body.username;
    var password=req.body.password;
    //先判断该账号是否存在
    //添加
         db.query(`INSERT INTO users \
            (username, password)
            VALUES('${username}', '${password}')`, (err, data)=>{
              if(err){
                console.error(err);
                res.status(500).send('database error').end();
              }else{
                res.redirect('/user/login');
              }
            });
  });
  return router;
};