package org.lion.service;

import org.lion.domain.User;

import java.util.List;

/**
 * Created by lion on 3/7/17.
 */
public interface UserService {
    void save(User user);

    User checkCode(User user);

    User login(User user);

    List<User> findAll();
}
