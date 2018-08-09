package com.wangsong.common.model;

public class Result<T> {
    private String result;
    private T data;

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Result(String result, T data) {
        super();
        this.result = result;
        this.data = data;
    }
    ;
}
