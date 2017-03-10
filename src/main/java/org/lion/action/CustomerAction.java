package org.lion.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;
import org.apache.struts2.ServletActionContext;
import org.lion.domain.Customer;
import org.lion.domain.PageBean;
import org.lion.service.CustomerService;
import org.lion.utils.JsonUtil;

import java.util.List;

/**
 * Created by lion on 3/9/17.
 */
public class CustomerAction extends ActionSupport implements ModelDriven<Customer> {

    private Customer customer = new Customer();

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    private CustomerService customerService;

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public String list() throws Exception {
        System.out.println("CustomerAction.list");
        List<Customer> all = customerService.findAll();
        PageBean<Customer> page = new PageBean<>();
        page.setBeanList(all);
        page.setTotalCount(all.size());
        page.setPageSize(2);
        ValueStack vs = ActionContext.getContext().getValueStack();
        vs.set("page", page);
        return "list";
    }

    public String save() throws Exception {
        System.out.println(customer);
        try {
            customerService.save(customer);
            JsonUtil.ajaxResult(ServletActionContext.getResponse(), 0, "");
        } catch (Exception e) {
            e.printStackTrace();
            JsonUtil.ajaxResult(ServletActionContext.getResponse(), 1, e.getMessage());
        }
        return NONE;
    }

    public String delete() throws Exception {
        System.out.println(customer);
        try {
            customerService.delete(customer.getCust_id());
            JsonUtil.ajaxResult(ServletActionContext.getResponse(), 0, "");
        } catch (Exception e) {
            e.printStackTrace();
            JsonUtil.ajaxResult(ServletActionContext.getResponse(), 1, e.getMessage());
        }
        return NONE;
    }

    public String modify() throws Exception {
        try {
            customer = customerService.findById(customer.getCust_id());
            ValueStack vs = ActionContext.getContext().getValueStack();
            vs.set("customer", customer);
            System.out.println(customer);
            if (customer == null) {
                return ERROR;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "edit";
    }

    @Override
    public Customer getModel() {
        return customer;
    }
}
