package org.lion.response;

/**
 * Created by lion on 3/9/17.
 */
public class DataResponse extends BaseResponse{
    private Object data;

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
