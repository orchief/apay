package com.sdb.corporbank.bean;

import com.sdb.payclient.bean.exception.*;

/**
 * ģ�⣨SF0009�������˿�״̬��ѯ
 * @author: zhuning090
 */
public class DemoSF0009 {	
	public static void main(String[] args) throws CsiiException {
		com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
		com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
		com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
		
		input.put("masterId","2000311146");  //�̻��ţ�ע������������Ҫ�滻���̻��Լ��������̻���
	    input.put("refundNo","20003111462016083127448429");  //�˿�ţ��ϸ����ظ�ʽ���̻���+8λ����YYYYMMDD+8λ��ˮ
	    
	    try {
	    	output = util.execute(input,"SF0009"); //ִ�з��ͣ�SF0009�������˿�״̬��ѯ���󣬲����ؽ������
			String errorCode = (String)output.getDataValue("errorCode");
			String errorMsg = (String)output.getDataValue("errorMsg");
			
			System.out.println("---�����˿�״̬��ѯ��ѯ�����ϸ��Ϣ---"+output);
			
			if((errorCode == null || errorCode.equals(""))&& (errorMsg == null || errorMsg.equals(""))){				
				System.out.println("---�̻���---"+output.getDataValue("masterId"));
				System.out.println("---�˿��---"+output.getDataValue("refundNo"));
				System.out.println("---�˿��������ʱ��---"+output.getDataValue("refundTime"));
				System.out.println("---ԭ������---"+output.getDataValue("orderId"));
				System.out.println("---����---"+output.getDataValue("currency"));
				System.out.println("---���������־---"+output.getDataValue("settleflg")); //�˿����ձ�־��0��δ�ۿ1���ѿۿ2���ۿ���
				System.out.println("---�����������־---"+output.getDataValue("refundFlag"));//�˿�ʧ�ܱ����˻���־��0��δ�˿1�����˿2��������
				System.out.println("---�µ�ʱ��---"+output.getDataValue("refundAmt"));
				System.out.println("---��Ʒ����---"+output.getDataValue("refundStatus"));//�˿�״̬��01�ɹ���02ʧ�ܣ�00������
			}else{
				System.out.println("---������---"+output.getDataValue("errorCode"));
				System.out.println("---����˵��---"+output.getDataValue("errorMsg"));
			}
	    }catch (Exception e) {
			e.printStackTrace();
		 }
	}
}
