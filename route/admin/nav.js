const express=require('express');
const common=require('../../libs/common');
const mysql=require('mysql');

var db=mysql.createPool({host: 'localhost', user: 'root', password: 'root', database: 'web'});

module.exports=function (){
  var router=express.Router();

  router.get('/', (req, res)=>{
    switch(req.query.act){
      case 'mod':
        db.query(`SELECT * FROM nav_table WHERE id=${req.query.id}`, (err, data)=>{
          if(err){
            console.error(err);
            res.status(500).send('database error').end();
          }else if(data.length==0){
            res.status(404).send('data not found').end();
          }else{
            db.query('SELECT * FROM nav_table', (err, navs)=>{
              if(err){
                console.error(err);

                res.status(500).send('database error').end();
              }else{
                res.render('admin/nav.ejs', {navs, mod_data: data[0]});
              }
            });
          }
        });
        break;
      case 'del':
        db.query(`DELETE FROM nav_table WHERE ID=${req.query.id}`, (err, data)=>{
          if(err){
            console.error(err);
            res.status(500).send('database error').end();
          }else{
            res.redirect('/admin/nav');
          }
        });
        break;
      default:
        db.query('SELECT * FROM nav_table', (err, navs)=>{
          if(err){
            console.error(err);
            res.status(500).send('database error').end();
          }else{
            res.render('admin/nav.ejs', {navs});
          }
        });
        break;
    }
  });
  router.post('/', (req, res)=>{
  	var name=req.body.name;
  	var href=req.body.href;
    var parent_id=req.body.parent_id;
    var level=req.body.level;
    var type=req.body.type;
    var qq=req.body.qq;
    var email=req.body.email;
    if(!name|| !href || !parent_id || !level || !type ){
      res.status(400).send('arg error').end();
    }else{
      if(req.body.mod_id){    //修改
        db.query(`UPDATE nav_table SET \
          name='${req.body.name}',\
          href='${req.body.href}',\
          parent_id='${req.body.parent_id}',\
          level='${req.body.level}',\
          type='${req.body.type}', \
          WHERE ID=${req.body.mod_id}`,
          (err, data)=>{
            if(err){
              console.error(err);
              res.status(500).send('database error').end();
            }else{
              res.redirect('/admin/nav');
            }
          }
        );
      }else{                  //添加
        db.query(`INSERT INTO nav_table (name,href,parent_id, level, type) VALUE('${name}','${href}', '${parent_id}', '${level}', '${type}')`, (err, data)=>{
          if(err){
            console.error(err);
            res.status(500).send('database error').end();
          }else{
            res.redirect('/admin/nav');
          }
        });
      }
    }
  });

  return router;
};