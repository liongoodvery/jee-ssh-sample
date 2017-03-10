package org.lion;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.lion.domain.Dict;
import org.lion.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Commit;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by lion on 3/9/17.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:applicationContext-test.xml"})
@Transactional
@Commit
public class DictTest {
    @Autowired
    DictService dictService;

    @Test
    public void test23() throws Exception {
        List<Dict> dicts = dictService.findByType("006");
        for (Dict dict : dicts) {
            System.out.println(dict);
        }
    }

}
