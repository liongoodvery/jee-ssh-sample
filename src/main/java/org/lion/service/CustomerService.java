package org.lion.service;

import org.lion.domain.Customer;

import java.io.Serializable;
import java.util.List;

/**
 * Created by lion on 3/9/17.
 */
public interface CustomerService {
    Customer findById(Serializable id);

    List<Customer> findAll();

    void save(Customer customer);

    void delete(Serializable id);
}
