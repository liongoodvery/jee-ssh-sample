package org.lion.service;

import org.lion.dao.CustomerDao;
import org.lion.domain.Customer;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * Created by lion on 3/9/17.
 */
@Transactional
public class CustomerServiceImpl implements CustomerService {
    private CustomerDao customerDao;

    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    @Override
    public Customer findById(Serializable id) {
        return customerDao.findById(id);
    }

    @Override
    public List<Customer> findAll() {
        return customerDao.findAll();
    }

    @Override
    public void save(Customer customer) {
        customerDao.save(customer);
    }
}
