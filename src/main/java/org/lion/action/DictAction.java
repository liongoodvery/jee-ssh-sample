package org.lion.action;

import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.lion.domain.Dict;
import org.lion.response.DataResponse;
import org.lion.service.DictService;
import org.lion.utils.JsonUtil;

import java.util.List;

/**
 * Created by lion on 3/9/17.
 */
public class DictAction extends BaseAction implements ModelDriven<Dict> {
    private DictService dictService;
    private Dict dict = new Dict();

    public void setDict(Dict dict) {
        this.dict = dict;
    }

    public void setDictService(DictService dictService) {
        this.dictService = dictService;
    }


    @Override
    public Dict getModel() {
        return dict;
    }

    public String findByType() throws Exception {
        System.out.println(dict);
        List<Dict> dicts = dictService.findByType(dict.getDict_type_code());
        DataResponse dataResponse = new DataResponse();
        if (dicts != null && dicts.size() > 0) {
            dataResponse.setCode(0);
            dataResponse.setData(dicts);
        } else {
            dataResponse.setCode(1);
        }
        String json = JsonUtil.toJSONString(dataResponse);
        System.out.println(json);
        JsonUtil.write_json(ServletActionContext.getResponse(),json);
        return NONE;
    }
}
