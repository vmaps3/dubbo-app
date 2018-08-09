package com.wangsong.common.model;

public class GetEasyUIData<T> {
    private T rows;
    private long total;

    public T getRows() {
        return rows;
    }

    public void setRows(T rows) {
        this.rows = rows;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public GetEasyUIData(T rows, long total) {
        super();
        this.rows = rows;
        this.total = total;
    }

    public GetEasyUIData() {

    }
}
