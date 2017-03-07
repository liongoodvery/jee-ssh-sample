package org.lion.service;

import org.lion.domain.User;

/**
 * Created by lion on 3/7/17.
 */
public interface UserService {
    void save(User user);

    User checkCode(User user);
}
