package org.lion.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;
import org.apache.struts2.ServletActionContext;
import org.lion.domain.User;
import org.lion.response.BaseResponse;
import org.lion.service.UserService;
import org.lion.utils.JsonUtil;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by lion on 3/7/17.
 */
public class UserAction extends BaseAction implements ModelDriven<User> {

    private User user = new User();

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
        User user = userService.checkCode(this.user);
        try {
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setContentType("text/plain;charset=UTF-8");
            PrintWriter writer = response.getWriter();
            if (user == null) {
                writer.write("no");
            } else {
                writer.write("yes");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    @Override
    public User getModel() {
        return user;
    }

    public String login() {
        User loginUser = userService.login(user);
        BaseResponse baseResponse = new BaseResponse();
        if (loginUser == null) {
            baseResponse.setCode(1);
            baseResponse.setMsg("no such user");
        } else {
            baseResponse.setCode(0);
            baseResponse.setMsg("success");
            ActionContext.getContext().getSession().put("existUser", loginUser);
        }

        JsonUtil.write_json(ServletActionContext.getResponse(),JsonUtil.toJSONString(baseResponse));
        return NONE;
    }

    public String list() {

        List<User> users = userService.findAll();
        ValueStack vs = ActionContext.getContext().getValueStack();
        vs.set("users", users);
        return "list";
    }
}
