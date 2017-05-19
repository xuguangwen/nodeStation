//这里是新闻动态
const express=require('express');
const common=require('../../libs/common');
const mysql=require('mysql');

var db=mysql.createPool({host: 'localhost', user: 'root', password: 'root', database: 'web'});

const pathLib=require('path');
const fs=require('fs');

module.exports=function (){
  var router=express.Router();

  router.get('/', function (req, res){
    switch(req.query.act){
      case 'del':
        db.query(`SELECT * FROM news_table WHERE ID=${req.query.id}`, (err, data)=>{
          if(err){
            console.error(err);
            res.status(500).send('database error').end();
          }else{
            if(data.length==0){
              res.status(404).send('no this news').end();
            }else{
              fs.unlink('static/upload/'+data[0].src, (err)=>{
                if(err){
                  console.error(err);
                  res.status(500).send('file opration error').end();
                }else{
                  db.query(`DELETE FROM news_table WHERE ID=${req.query.id}`, (err, data)=>{
                    if(err){
                      console.error(err);
                      res.status(500).send('database error').end();
                    }else{
                      res.redirect('/admin/news');
                    }
                  });
                }
              });
            }
          }
        });
        break;
      case 'mod':
        db.query(`SELECT * FROM news_table WHERE ID=${req.query.id}`, (err, data)=>{
          if(err){
            console.error(err);
            res.status(500).send('database error').end();
          }else if(data.length==0){
            res.status(404).send('no this news').end();
          }else{
            db.query(`SELECT * FROM news_table`, (err, news)=>{
              if(err){
                console.error(err);
                req.status(500).send('database error').end();
              }else{
                res.render('admin/news.ejs', {news, mod_data: data[0]});
              }
            });
          }
        });
        break;
      default:
        db.query(`SELECT * FROM news_table`, (err, news)=>{
          if(err){
            console.error(err);
            req.status(500).send('database error').end();
          }else{
            res.render('admin/news.ejs', {news});
          }
        });
    }
  });
  router.post('/', function (req, res){
    var title=req.body.title;
    var summary=req.body.summary;
    var content=req.body.content;
    var keyword=req.body.keyword;
    var post_time=req.body.post_time;
    var view=req.body.view;

    if(req.files[0]){
      var ext=pathLib.parse(req.files[0].originalname).ext;

      var oldPath=req.files[0].path;
      var newPath=req.files[0].path+ext;

      var newFileName=req.files[0].filename+ext;
    }else{
      var newFileName=null;
    }

    if(newFileName){
      fs.rename(oldPath, newPath, (err)=>{
        if(err){
          console.error(err);
          res.status(500).send('file opration error').end();
        }else{
          if(req.body.mod_id){  //修改
            //先删除老的
            db.query(`SELECT * FROM news_table WHERE ID=${req.body.mod_id}`, (err, data)=>{
              if(err){
                console.error(err);
                res.status(500).send('database error').end();
              }else if(data.length==0){
                res.status(404).send('old file not found').end();
              }else{
                fs.unlink('static/upload/'+data[0].src, (err)=>{
                  if(err){
                    console.error(err);
                    res.status(500).send('file opration error').end();
                  }else{
                    db.query(`UPDATE news_table SET \
                      title='${title}', summary='${summary}',content='${content}' \
                      src='${newFileName}', keyword='${keyword}',post_time='${post_time}',view='${view}'\
                      WHERE ID=${req.body.mod_id}`, (err)=>{
                        if(err){
                          console.error(err);
                          res.status(500).send('database error').end();
                        }else{
                          res.redirect('/admin/news');
                        }
                      });
                  }
                });
              }
            });
          }else{                //添加
            db.query(`INSERT INTO news_table \
            (title, summary,content,src,keyword,post_time,view)
            VALUES('${title}', '${summary}','${content}','${newFileName}','${keyword}','${post_time}', '${view}')`, (err, data)=>{
              if(err){
                console.error(err);
                res.status(500).send('database error').end();
              }else{
                res.redirect('/admin/news');
              }
            });
          }
        }
      });
    }else{
      if(req.body.mod_id){  //修改
        //直接改
        db.query(`UPDATE news_table SET \
          title='${title}', summary='${summary}',content='${content}',keyword='${keyword}',post_time='${post_time}',view='${view}' \
          WHERE ID=${req.body.mod_id}`, (err)=>{
            if(err){
              console.error(err);
              res.status(500).send('database error').end();
            }else{
              res.redirect('/admin/news');
            }
          });
      }else{                //添加
        db.query(`INSERT INTO news_table \
        (title, summary,content,src,keyword,post_time,view)
        VALUES('${title}', '${summary}','${content}','${newFileName}','${keyword}','${post_time}', '${view}')`, (err, data)=>{
          if(err){
            console.error(err);
            res.status(500).send('database error').end();
          }else{
            res.redirect('/admin/news');
          }
        });
      }
    }
  });

  return router;
};
