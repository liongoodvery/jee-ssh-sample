package org.lion.dao;

import org.lion.domain.Dict;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by lion on 3/9/17.
 */
public class DictDaoImpl extends HibernateDaoSupport implements DictDao {
    @Override
    public Dict findById(String id) {
        return getHibernateTemplate().get(Dict.class, id);
    }

    @Override
    public List<Dict> findByType(String type) {
        return (List<Dict>) getHibernateTemplate().find("from Dict where dict_type_code=?", type);
    }
}
