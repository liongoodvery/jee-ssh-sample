package org.lion.dao;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.lion.domain.Book;

import java.util.List;

/**
 * Created by lion on 3/13/17.
 */
public class BookDaoImpl extends BaseDaoImpl<Book> implements  BookDao {
    @Override
    public List<Book> findAll() {
        DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
        criteria.addOrder(Order.desc("accessTime"));
        return (List<Book>) getHibernateTemplate().findByCriteria(criteria);
    }
}
