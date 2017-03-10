package org.lion.dao;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.lion.domain.User;

import java.util.List;

/**
 * Created by lion on 3/7/17.
 */
public class UserDaoImpl  extends BaseDaoImpl<User> implements UserDao{
    @Override
    public User checkCode(User user) {
        DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
        criteria.add(Restrictions.eq("user_code", user.getUser_code()));
        List<User> list = (List<User>) getHibernateTemplate().findByCriteria(criteria);
        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public User find(User user) {
        List<?> list = getHibernateTemplate().find("from User where user_code=? and user_password=? and user_state=?", user.getUser_code(), user.getUser_password(),"1");
        if (list != null && list.size() > 0) {
            return (User) list.get(0);
        }
        return null;
    }
}
