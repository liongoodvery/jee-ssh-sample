package org.lion.dao;

import org.lion.domain.User;

/**
 * Created by lion on 3/7/17.
 */
public interface UserDao extends BaseDao<User> {

    User checkCode(User user);

    User find(User user);
}
