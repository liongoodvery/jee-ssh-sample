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

String.prototype.format = String.prototype.f = function () {
    var s = this,
        i = arguments.length;

    while (i--) {
        s = s.replace(new RegExp('\\{' + i + '\\}', 'gm'), arguments[i]);
    }
    return s;
};

class Constants {
    constructor() {
        this.TYPE_LEVEL = '006';
        this.TYPE_SOURCE = '009';
    }

}


class Customer {
    constructor(){
        this.DELETE_ACTION='customer_delete';
        this.MODIFY_ACTION='customer_modify';
    }
    loadOptionByType(dict_type_code, $container) {
        $.post("dict_findByType.action", {'dict_type_code': dict_type_code}, function (data) {
            console.log(data);
            if (data.code == 0) {
                $.each(data.data, function (i, n) {
                    let option = '<option value="{0}">{1}</option>'.format(n.dict_id, n.dict_item_name)
                    console.log(option);
                    $container.append(option)
                })
            }
        }, 'json')
    };

    delete(custId, successCallback, faildeCallback) {
        this.__do_by_cust_id(this.DELETE_ACTION, custId, successCallback, faildeCallback);
    }

    modify(custId, successCallback, faildeCallback){
        this.__do_by_cust_id(this.MODIFY_ACTION, custId, successCallback, faildeCallback,'html');
    }

    __do_by_cust_id(action,custId, successCallback, faildeCallback,type){
        if (!type) {
            type = 'json';
        }
        $.post(action , {'cust_id': custId}, function (data) {
            if (type!='json'){
                if (successCallback) {
                    successCallback(data);
                }
                return;
            }
            if (data.code == 0) {
                if (successCallback) {
                    successCallback(data);
                }
            } else {
                if (faildeCallback){
                    faildeCallback(data);
                }
            }
        }, type);
    }

}
class ContentLoader {
    load($container, url, parmas, callback) {
        $container.load(url, parmas, callback);
    }

    loadAddCustomer() {
        $("#content").load("jsp/customer/add.jsp")
    }
}