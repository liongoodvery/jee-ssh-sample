<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AddBook</title>
</head>
<body>
<div class="content">
    <form id="book" action="book_put" method="post" enctype="multipart/form-data">
        <label for="bookName">Book Name</label><input type="text" id="bookName" name="bookName"><br/>
        <label for="startPage">Start Page</label>
        <select type="text" id="startPage" name="startPage">
            <option value="toc.xhtml" selected>toc.xhtml</option>
            <option value="index.html" >index.html</option>
            <option value="index.xhtml" >index.xhtml</option>
        </select><br/>
        <label>File</label><input type="file" name="upload" id="upload"><br/>
        <input type="submit"><br/>
        <input  type="reset" id="reset">
    </form>
    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/main.js"></script>
    <script>
        $('input[type="submit"]').click(function () {
            var formData = new FormData();
            var name = $("#uploa").val();
            formData.append("upload",$("#upload")[0].files[0]);
            formData.append("bookName",$("#bookName").val())
            formData.append("startPage",$("#startPage").val())
            $.ajax({
                url : "book_put",
                type : 'POST',
                data : formData,
                // 告诉jQuery不要去处理发送的数据
                processData : false,
                // 告诉jQuery不要去设置Content-Type请求头
                contentType : false,
                beforeSend:function(){
                    console.log("正在进行，请稍候");
                },
                success : function(responseStr) {
                    if(responseStr.code===0){
                        console.log("成功"+responseStr);
                        let r = confirm("添加成功,继续添加?")
                        if (r) {
                            $('#reset').click();
                        }else{
                            window.location = "book_list";
                        }
                    }else{
                        alert("添加失败")
                        console.log("失败"+responseStr.msg);
                    }
                },
                error : function(responseStr) {
                    console.log("error");
                }
            });
            return false;
        });
    </script>
</div>
</body>
</html>
