package org.lion.dao;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.lion.domain.PageBean;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/**
 * Created by lion on 3/10/17.
 */
public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T> {
    private Class clazz;

    public BaseDaoImpl() {
        Type type = this.getClass().getGenericSuperclass();
        if (type instanceof ParameterizedType) {
            Type[] types = ((ParameterizedType) type).getActualTypeArguments();
            if (types.length != 1) {
                throw new RuntimeException("one and only one type template is required!");
            }
            this.clazz = (Class) types[0];
        } else {
            throw new RuntimeException("type template is required!");
        }
    }

    @Override
    public boolean save(T t) {
        getHibernateTemplate().save(t);
        return true;
    }

    @Override
    public void delete(T t) {
        if (t == null) {
            throw new NullPointerException();
        }
        getHibernateTemplate().delete(t);
    }

    @Override
    public void update(T t) {
        getHibernateTemplate().update(t);
    }

    @Override
    public T findById(Serializable id) {
        return (T) getHibernateTemplate().get(this.clazz, id);
    }

    @Override
    public List<T> findAll() {
        return (List<T>) getHibernateTemplate().find("from " + clazz.getSimpleName());
    }

    @Override
    public PageBean<T> findByPage(Integer pageCode, Integer pageSize) {
        PageBean pageBean = null;
        DetachedCriteria criteria = DetachedCriteria.forClass(clazz);
        criteria.setProjection(Projections.rowCount());
        List<Number> rowCount = (List<Number>) getHibernateTemplate().findByCriteria(criteria);
        if (rowCount != null && rowCount.size() > 0) {
            pageBean = new PageBean();
            pageBean.setTotalCount(rowCount.get(0).intValue());
            pageBean.setPageCode(pageCode);
            pageBean.setPageSize(pageSize);
            criteria.setProjection(null);
            List<T> beanList = (List<T>) getHibernateTemplate().findByCriteria(criteria, (pageCode - 1) * pageSize, pageSize);
            pageBean.setBeanList(beanList);
        }
        return pageBean;
    }
}
