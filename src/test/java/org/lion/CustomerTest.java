package org.lion;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.lion.domain.Customer;
import org.lion.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Commit;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;
import java.util.List;

/**
 * Created by lion on 3/9/17.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:applicationContext-test.xml"})
@Transactional
@Commit
public class CustomerTest {
    @Autowired
    CustomerService customerService;

    @Autowired
    DataSource dataSource;
    @Test
    public void testFindById() throws Exception {
        Customer customer = customerService.findById(1L);
        System.out.println(customer);
    }
    @Test
    public void testFindAll() throws Exception {
        List<Customer> customers = customerService.findAll();
        System.out.println(customers);
    }

    @Test
    public void testDelete() throws Exception {
        customerService.delete(500L);
    }

    @Test
    public void test45() throws Exception {
        System.out.println(dataSource);
    }
}
