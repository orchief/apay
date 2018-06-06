package com.sdb.corporbank.bean;

import com.sdb.payclient.bean.exception.*;

/**
 * ģ�⣨SF0008�����ʶ���֧��״̬��ѯ
 * @author: zhuning090
 */
public class DemoSF0008 {	
	public static void main(String[] args) throws CsiiException {
		com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
		com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
		com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
		
		input.put("masterId","2000311146");  //�̻��ţ�ע������������Ҫ�滻���̻��Լ��������̻���
	    input.put("orderId","20003111462017060644723674");  //�����ţ��ϸ����ظ�ʽ���̻���+8λ����YYYYMMDD+8λ��ˮ
	    
	    try {
	    	output = util.execute(input,"SF0008"); //ִ�з��ͣ�SF0008�����ʶ���״̬��ѯ���󣬲����ؽ������
			String errorCode = (String)output.getDataValue("errorCode");
			String errorMsg = (String)output.getDataValue("errorMsg");
			
			System.out.println("---���ʶ���֧��״̬��ѯ�����ϸ��Ϣ---"+output);
			
			if((errorCode == null || errorCode.equals(""))&& (errorMsg == null || errorMsg.equals(""))){				
				System.out.println("---����״̬---"+output.getDataValue("status"));
				System.out.println("---֧�����ʱ��---"+output.getDataValue("date"));
				System.out.println("---�����ѽ��---"+output.getDataValue("charge"));
				System.out.println("---�̻���---"+output.getDataValue("masterId"));
				System.out.println("---������---"+output.getDataValue("orderId"));
				System.out.println("---����---"+output.getDataValue("currency"));
				System.out.println("---�������---"+output.getDataValue("amount"));
				System.out.println("---�µ�ʱ��---"+output.getDataValue("paydate"));
				System.out.println("---��Ʒ����---"+output.getDataValue("objectName"));
				System.out.println("---������Ч��---"+output.getDataValue("validtime"));
				System.out.println("---��ע---"+output.getDataValue("remark"));
				System.out.println("---���������־---"+output.getDataValue("settleflg"));  //1�����㣬0������
				System.out.println("---��������ʱ��---"+output.getDataValue("settletime"));
				System.out.println("---�����������־---"+output.getDataValue("chargeflg"));  //1�����㣬0������
				System.out.println("---����������ʱ��---"+output.getDataValue("chargetime"));
				System.out.println("---�̻���������---"+output.getDataValue("orderType"));
			}else{
				System.out.println("---������---"+output.getDataValue("errorCode"));
				System.out.println("---����˵��---"+output.getDataValue("errorMsg"));
			}

	    }catch (Exception e) {
			e.printStackTrace();
		 }
	}
}
