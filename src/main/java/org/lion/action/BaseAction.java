package org.lion.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by lion on 3/7/17.
 */
public class BaseAction extends ActionSupport {
    public void put(String key, Object obj) {
        ActionContext.getContext().getValueStack().set(key, obj);
    }
    public void put(Object obj) {
        ActionContext.getContext().getValueStack().push(obj);
    }
}
