package com.sdb.corporbank.bean;

import com.sdb.payclient.bean.exception.*;

/**
 * ģ�⣨Union10004����ѯ�̻�T0��Ϣ
 * @author: zhuning090
 */
public class DemoUnion10004 {	
	public static void main(String[] args) throws CsiiException {
		com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
		com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
		com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
		
		input.put("masterId","2000311146");  //�̻��ţ�ע������������Ҫ�滻���̻��Լ��������̻���
	    
	    try {
	    	output = util.execute(input,"Union10004"); //ִ�з��ͣ�Union10004����ѯ�̻�T0��Ϣ���󣬲����ؽ������
			String errorCode = (String)output.getDataValue("errorCode");
			String errorMsg = (String)output.getDataValue("errorMsg");
			
			System.out.println("---��ѯ�̻�T0�Ų�ѯ�����ϸ��Ϣ---"+output);
			
			if((errorCode == null || errorCode.equals(""))&& (errorMsg == null || errorMsg.equals(""))){				
				System.out.println("---T0���״̬---"+output.getDataValue("status"));//TO���� 0����T0�����,1����T0���
				System.out.println("---T0�ܶ��---"+output.getDataValue("amount"));//T0�ܶ��
				System.out.println("---�̻�T0�������---"+output.getDataValue("useamount"));//�̻�T0�������
				System.out.println("---�̻�T0�����޶�---"+output.getDataValue("singlelimt"));//�̻�T0�����޶�
			}else{
				System.out.println("---������---"+output.getDataValue("errorCode"));
				System.out.println("---����˵��---"+output.getDataValue("errorMsg"));
			}

	    }catch (Exception e) {
			e.printStackTrace();
		 }
	}
}
