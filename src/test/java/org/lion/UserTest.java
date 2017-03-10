package org.lion;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.lion.dao.UserDao;
import org.lion.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by lion on 3/9/17.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext-test.xml"})
@Transactional
@Rollback
public class UserTest {

    @Autowired
    UserDao userDao;

    @Test
    public void testDelete() throws Exception {
        User user = userDao.findById(1L);
        Assert.assertNotNull(user);
        userDao.delete(user);
        assertSize(3);
    }

    @Test(expected = NullPointerException.class)
    public void testDeleteNull() throws Exception {
        User user = userDao.findById(100L);
        userDao.delete(user);
    }

    @Test
    public void testFindAll() throws Exception {
        assertSize(4);
    }


    @Test
    public void testSave() throws Exception {
        User user = new User();
        user.setUser_name("haha");
        user.setUser_code("haha");
        user.setUser_password("haha");
        user.setUser_state("1");
        userDao.save(user);
        assertSize(5);
    }

    @Test
    public void test58() throws Exception {
        User user = userDao.findById(1L);
        userDao.save(user);
        assertSize(4);
    }
    private void assertSize(int expected) {
        Assert.assertEquals(expected, userDao.findAll().size());
    }
}
