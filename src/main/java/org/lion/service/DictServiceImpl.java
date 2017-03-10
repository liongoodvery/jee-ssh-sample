package org.lion.service;

import org.lion.dao.DictDao;
import org.lion.domain.Dict;

import java.util.List;

/**
 * Created by lion on 3/9/17.
 */
public class DictServiceImpl implements DictService{
    private DictDao dictDao;

    public void setDictDao(DictDao dictDao) {
        this.dictDao = dictDao;
    }

    @Override
    public List<Dict> findByType(String type) {
        return dictDao.findByType(type);
    }
}
