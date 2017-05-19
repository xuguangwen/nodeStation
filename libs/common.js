const crypto=require('crypto');
module.exports={
  MD5_SUFFIX: 'FDSW$t34tregt5tO&$(#RHuyoyiUYE*&OI$HRLuy87odlfh是个风格热腾腾)',
  md5: function (str){
    var obj=crypto.createHash('md5');
    obj.update(str);
    return obj.digest('hex');
  }
};
