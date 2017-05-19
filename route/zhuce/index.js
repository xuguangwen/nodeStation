
const express=require('express');
const common=require('../../libs/common');

module.exports=function (){
  var router=express.Router();
  router.get('/', (req, res)=>{
    res.render('zhuce/register.ejs', {});
  });
  router.use('/register', require('./register')());
  return router;
};
