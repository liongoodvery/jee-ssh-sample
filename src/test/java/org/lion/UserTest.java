package org.lion;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.lion.domain.User;
import org.lion.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Commit;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lion on 3/9/17.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@Commit
public class UserTest {
    @Resource(name = "userService")
    UserService userService;
    @Autowired
    User user;
    @Test
    public void testLogin() throws Exception {
        Assert.assertNotNull(userService);
        User user = userService.login(this.user);
        System.out.println(user);
    }

    @Test
    public void testFindAll() throws Exception {
        List<User> all = userService.findAll();
        for (User user1 : all) {
            System.out.println(user1);
        }
    }
}
