package org.lion.dao;

import org.lion.domain.User;

/**
 * Created by lion on 3/7/17.
 */
public interface UserDao {
    void save(User user);

    User checkCode(User user);
}
