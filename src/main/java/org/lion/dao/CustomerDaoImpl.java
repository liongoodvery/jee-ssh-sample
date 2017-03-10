package org.lion.dao;

import org.lion.domain.Customer;
import org.lion.exception.DaoException;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.io.Serializable;
import java.util.List;

/**
 * Created by lion on 3/9/17.
 */
public class CustomerDaoImpl extends HibernateDaoSupport implements CustomerDao {
    @Override
    public Customer findById(Serializable id) {
        return getHibernateTemplate().get(Customer.class, id);
    }

    @Override
    public List<Customer> findAll() {
        return (List<Customer>) getHibernateTemplate().find("from Customer ");
    }

    @Override
    public void save(Customer customer) {
        Serializable id = getHibernateTemplate().save(customer);
        if (id == null) {
            throw new DaoException("save customer failed!!");
        }
    }
}
