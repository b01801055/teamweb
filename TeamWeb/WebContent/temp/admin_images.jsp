<%@page contentType="text/html; charset=utf-8"%>
<%@page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style type="text/css">
        #imgUpload { background-color: #DDD; padding: 5px 15px; font-size: 15px; }
        #imgFile { color: #FFF; background-color: #FFF; padding: 3px;
          border: 1px solid #BBB; border-radius:5px;}
        #imgUpload input { vertical-align: middle; }
      
        .imgContainer { display: flex; flex-wrap: wrap; justify-content: center; }
        .fileItem { width: 150px; /*height: 220px;*/ float: left; margin: 14px; padding: 5px; overflow:hidden;
          background-color: #F5F5F5; text-align: center; border: 1px dotted #BDBDBD; }
        .fileItem h3 { color: #FFF; background-color: #838383; font-size: 14px; text-align: left;
          margin: 0; padding: 3px; 
          white-space: nowrap; overflow: hidden; text-overflow: ellipsis;	-o-text-overflow: ellipsis; }
        .fileItem img {	display: block;	width: 140px; height: auto; margin: 0px auto; }
        .delImgBtn{ margin:5px 0; width:100%;	text-align:center; }
      </style>
</head>
<body>
    <h1>商品上傳</h1>

<form name="imgUpload" id="imgUpload" enctype="multipart/form-data" method="post" action="">
  選擇要上傳的影像：
  <input type="file" name="imgFile[]" id="imgFile" style="width:400px; color:#000;" multiple="multiple" required>

  <input type="submit" id="btnSubmit" value="確定上傳">
  <span style="color:red; font-size:12px;"> (上傳的檔案名稱請符合英數字及減號或底線....) </span>
</form>

<div class="imgContainer">
    <div class="fileItem">
        <h3><?php echo $fileName; ?></h3>
        <input type="button" class="delImgBtn" value="刪除影像" title="<?php echo $file; ?>">
        <img src="<?php echo $file; ?>">
      </div>   
      <?php        
      }
      ?>
    
    </div>
</body>
</html>

<script src="../js/jquery-1.8.3.min.js"></script>
<script>
  $('.delImgBtn').click(function(){
    var $file = $(this).attr('title');  console.log($file);

    if( confirm('確定刪除？') ){
      $.ajax({
        url:'admin_images_delete.php'
        ,type:'post'
        ,data:{ file: $file }
      }).done(function(msg){
        if(msg==1){ window.location.reload(); }
      });
    }
  });
</script>