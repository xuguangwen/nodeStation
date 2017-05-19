const express=require('express');
const mysql=require('mysql');

var db=mysql.createPool({host: 'localhost', user: 'root', password: 'root', database: 'web'});

module.exports=function (){
  var router=express.Router();
//导航栏
router.get('/get_navs', (req,res)=>{
  db.query('SELECT * FROM nav_table',(err,data)=>{
    if(err){
      console.error(err);
      res.status(500).send('database error').end();
    }else{
      res.send(data).end();
    }
  });
});
//产品表
router.get('/get_products', (req,res)=>{
  db.query('SELECT * FROM products_table',(err,data)=>{
    if(err){
      console.error(err);
      res.status(500).send('database error').end();
    }else{
      res.send(data).end();
    }
  });
});
//新闻详情页数据输出
router.get('/get_news', (req, res)=>{
db.query('SELECT * FROM news_table', (err, data)=>{
  if(err){
    console.error(err);
    res.status(500).send('database error').end();
  }else{
    res.send(data).end();
  }
});
});
//主页新闻概要输出,这里输出热点新闻
router.get('/get_hotNews', (req, res)=>{
db.query('SELECT * FROM news_table WHERE view >= 5000', (err, data)=>{
  if(err){
    console.error(err);
    res.status(500).send('database error').end();
  }else{
    res.send(data).end();
  }
});
});
//按热度输出新闻降序排
router.get('/get_descNews', (req, res)=>{
db.query('select * from news_table order by view desc', (err, data)=>{
  if(err){
    console.error(err);
    res.status(500).send('database error').end();
  }else{
    res.send(data).end();
  }
});
});
//banner数据输出
router.get('/get_banners', (req, res)=>{
db.query('SELECT * FROM banner_table', (err, data)=>{
  if(err){
    console.error(err);
    res.status(500).send('database error').end();
  }else{
    res.send(data).end();
  }
});
});
//合作伙伴(patner)数据输出
router.get('/get_patners', (req, res)=>{
db.query('SELECT * FROM patner_table', (err, data)=>{
  if(err){
    console.error(err);
    res.status(500).send('database error').end();
  }else{
    res.send(data).end();
  }
});
});
//服务数据
router.get('/get_server', (req, res)=>{
db.query('SELECT * FROM fuwu_table', (err, data)=>{
  if(err){
    console.error(err);
    res.status(500).send('database error').end();
  }else{
    res.send(data).end();
  }
});
});
//关于我们(aboutus)数据输出
router.get('/get_aboutus', (req, res)=>{
db.query('SELECT * FROM aboutus_table', (err, data)=>{
  if(err){
    console.error(err);
    res.status(500).send('database error').end();
  }else{
    res.send(data).end();
  }
});
});
//联系我们(contact)
router.get('/get_contact', (req, res)=>{
db.query('SELECT * FROM contact_table', (err, data)=>{
  if(err){
    console.error(err);
    res.status(500).send('database error').end();
  }else{
    res.send(data).end();
  }
});
});
  return router;
};
