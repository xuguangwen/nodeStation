# vue-node-mysql
## this is bootstrap+vue+node+express+mysql porject
## 该系统为建设一个高可扩展的H5企业网站，主要功能模块图如下：

![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/mvc.png)

### 该系统分为前台用户子系统和后台企业管理子系统，具体系统用例图如下：

![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/usecase01.png)

![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/usecase.png)

### 根据功能性需求，使用starUML建立数据库E-R图如下：

![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/dataer.png)

### 本系统需要安装通过install express cookie cookie-session body-parser  mysql express-static express-route multer consolidate ejs -D来安装模块依赖。

#### 后台管理登录页 采用md5加密，主要功能代码为：<br>
const crypto=require('crypto');<br>
module.exports={<br>
  MD5_SUFFIX: 'FDSW$t34tregt5tO&$(#RHuyoyiUYE*&OI$HRLuy87odlfh是个风格热腾腾)',<br>  
  md5: function (str){<br>
    var obj=crypto.createHash('md5');<br>
    obj.update(str);<br> 
    return obj.digest('hex');<br>  
  }<br> 
};<br>
之后再验证登录：
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

后台登录页面效果图如下：
![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/login01.png)

后台管理首页

![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/02.png)

公司案例产品管理页

![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/03.png)

合作伙伴管理

![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/04.png)
![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/04.1.png)

关于我们

![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/05.png)

联系我们

![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/06.png)



代码结构

![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/jiegou.png)

数据库数据

![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/shujuku.png)

前台页面

![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/index.png)

![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/news.png)

![image](https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/readme/news2.png)

详情请下载https://github.com/k2-xu/vue-express-ejs-node-mysql/blob/master/%E8%AF%B4%E6%98%8E%E6%96%87%E6%A1%A3.doc  说明文档。

如有问题欢迎咨询本人QQ：326531916  微信：xu326531916


