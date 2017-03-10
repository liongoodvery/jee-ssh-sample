package org.lion.dao;

import org.lion.domain.Dict;

import java.util.List;

/**
 * Created by lion on 3/9/17.
 */
public interface DictDao {
    Dict findById(String id);

    List<Dict> findByType(String type);
}
