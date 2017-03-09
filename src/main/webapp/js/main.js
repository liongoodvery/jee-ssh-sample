/**
 * Created by lion on 3/9/17.
 */
function MenuDisplay(obj_id) {
    for (var i = 1; i <= 9; i++) {
        var obj = document.getElementById('table_' + i);
        if (obj) {
            document.getElementById('table_' + i).style.display = 'none';
            document.getElementById('table_' + i + 'Span').innerText = '＋';
        }

    }
    var obj = document.getElementById(obj_id);
    if (obj) {
        if (obj.style.display == 'none') {
            obj.style.display = 'block';
            document.getElementById(obj_id + 'Span').innerText = '－';
        } else {
            obj.style.display = 'none';
            document.getElementById(obj_id + 'Span').innerText = '＋';
        }
    }

}

class ContentLoader{
    loadAddCustomer(){
        $("#content").load("jsp/customer/add.jsp")
    }
}