//联系我们
const express=require('express');
const common=require('../../libs/common');
const mysql=require('mysql');

var db=mysql.createPool({host: 'localhost', user: 'root', password: 'root', database: 'web'});

module.exports=function (){
  var router=express.Router();

  router.get('/', (req, res)=>{
    switch(req.query.act){
      case 'mod':
        db.query(`SELECT * FROM contact_table WHERE id=${req.query.id}`, (err, data)=>{
          if(err){
            console.error(err);
            res.status(500).send('database error').end();
          }else if(data.length==0){
            res.status(404).send('data not found').end();
          }else{
            db.query('SELECT * FROM contact_table', (err, contacts)=>{
              if(err){
                console.error(err);

                res.status(500).send('database error').end();
              }else{
                res.render('admin/contact.ejs', {contacts, mod_data: data[0]});
              }
            });
          }
        });
        break;
      case 'del':
        db.query(`DELETE FROM contact_table WHERE ID=${req.query.id}`, (err, data)=>{
          if(err){
            console.error(err);
            res.status(500).send('database error').end();
          }else{
            res.redirect('/admin/contact');
          }
        });
        break;
      default:
        db.query('SELECT * FROM contact_table', (err, contacts)=>{
          if(err){
            console.error(err);
            res.status(500).send('database error').end();
          }else{
            res.render('admin/contact.ejs', {contacts});
          }
        });
        break;
    }
  });
  router.post('/', (req, res)=>{
  	var person=req.body.person;
  	var company_name=req.body.company_name;
    var address=req.body.address;
    var phone=req.body.phone;
    var tel=req.body.tel;
    var qq=req.body.qq;
    var email=req.body.email;
    if(!person|| !company_name || !address || !phone || !tel || !qq || !email){
      res.status(400).send('arg error').end();
    }else{
      if(req.body.mod_id){    //修改
        db.query(`UPDATE contact_table SET \
          person='${req.body.person}',\
          company_name='${req.body.company_name}',\
          address='${req.body.address}',\
          phone='${req.body.phone}',\
          tel='${req.body.tel}', \
          tel='${req.body.qq}' ,\
          tel='${req.body.email}',\
          WHERE ID=${req.body.mod_id}`,
          (err, data)=>{
            if(err){
              console.error(err);
              res.status(500).send('database error').end();
            }else{
              res.redirect('/admin/contact');
            }
          }
        );
      }else{                  //添加
        db.query(`INSERT INTO contact_table (person,company_name,address, phone, tel, qq, email) VALUE('${person}','${company_name}', '${address}', '${phone}', '${tel}', '${qq}','${email}')`, (err, data)=>{
          if(err){
            console.error(err);
            res.status(500).send('database error').end();
          }else{
            res.redirect('/admin/contact');
          }
        });
      }
    }
  });

  return router;
};