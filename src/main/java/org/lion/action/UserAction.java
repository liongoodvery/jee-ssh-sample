package org.lion.action;

import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.lion.domain.User;
import org.lion.service.UserService;

import java.io.IOException;

/**
 * Created by lion on 3/7/17.
 */
public class UserAction extends BaseAction implements ModelDriven<User> {

    private User user=new User();

    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public String execute() throws Exception {
        System.out.println(user);
        return NONE;
    }

    public String regist() {
        System.out.println(user);
        userService.save(user);
        return "ok";
    }
    public String checkCode() {
        System.out.println(user);
        userService.checkCode(user);
        try {
            ServletActionContext.getResponse().getWriter().write("hello");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "ok";
    }

    @Override
    public User getModel() {
        return user;
    }
}
