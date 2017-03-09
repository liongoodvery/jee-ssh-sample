package org.lion.utils;

import java.util.Collection;
import java.util.Map;

/**
 * Created by lion on 3/8/17.
 */
public class CommonUtils {
    public static boolean isEmpty(Collection collection) {
        return collection == null || collection.size() == 0;
    }

    public static boolean isEmpty(Map collection) {
        return collection == null || collection.size() == 0;
    }
}
