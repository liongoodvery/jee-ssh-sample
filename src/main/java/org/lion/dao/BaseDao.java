package org.lion.dao;

import org.lion.domain.PageBean;

import java.io.Serializable;
import java.util.List;

/**
 * Created by lion on 3/10/17.
 */
public interface BaseDao<T> {
    boolean save(T t);

    void delete(T t);

    void update(T t);

    T findById(Serializable id);

    List<T> findAll();

    PageBean<T> findByPage(Integer pageCode, Integer pageSize);
}
