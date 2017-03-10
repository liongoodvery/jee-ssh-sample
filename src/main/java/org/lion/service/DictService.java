package org.lion.service;

import org.lion.domain.Dict;

import java.util.List;

/**
 * Created by lion on 3/9/17.
 */
public interface DictService {
    List<Dict> findByType(String type);
}
