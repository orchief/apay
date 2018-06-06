package com.orchief.pay2.model;

import java.util.Map;

public class ResultModel {
	//返回码
	private int errcode;
	//返回消息
	private String errmsg;
	//数据源
	private Map<String,Object> data;
	
	public int getErrcode() {
		return errcode;
	}
	public void setErrcode(int errcode) {
		this.errcode = errcode;
	}
	public String getErrmsg() {
		return errmsg;
	}
	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}
	public Map<String, Object> getData() {
		return data;
	}
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
}
