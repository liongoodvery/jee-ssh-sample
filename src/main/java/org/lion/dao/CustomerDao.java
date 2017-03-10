package org.lion.dao;

import org.lion.domain.Customer;

import java.io.Serializable;
import java.util.List;

/**
 * Created by lion on 3/9/17.
 */
public interface CustomerDao {
    Customer findById(Serializable id);

    List<Customer> findAll();

    void save(Customer customer);
}
