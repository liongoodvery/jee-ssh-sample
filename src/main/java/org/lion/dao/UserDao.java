package org.lion.dao;

import org.lion.domain.User;

import java.util.List;

/**
 * Created by lion on 3/7/17.
 */
public interface UserDao {
    void save(User user);

    User checkCode(User user);

    User find(User user);

    List<User> findAll();
}
