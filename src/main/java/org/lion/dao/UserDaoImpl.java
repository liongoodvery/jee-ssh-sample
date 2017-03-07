package org.lion.dao;

import org.lion.domain.User;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

/**
 * Created by lion on 3/7/17.
 */
public class UserDaoImpl  extends HibernateDaoSupport implements UserDao{
    @Override
    public void save(User user) {
        getHibernateTemplate().save(user);
    }

    @Override
    public User checkCode(User user) {
        return null;
    }
}
