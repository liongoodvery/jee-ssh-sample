package org.lion.service;

import org.lion.dao.UserDao;
import org.lion.domain.User;
import org.lion.utils.MD5Utils;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by lion on 3/7/17.
 */
@Transactional
public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public void save(User user) {
        user.setUser_state("1");
        user.setUser_password(MD5Utils.md5(user.getUser_password()));
        userDao.save(user);
    }

    @Override
    public User checkCode(User user) {
        return userDao.checkCode(user);
    }

    @Override
    public User login(User user) {
        user.setUser_password(MD5Utils.md5(user.getUser_password()));
        return userDao.find(user);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

}
