package com.sdb.corporbank.bean;

import com.sdb.payclient.bean.exception.*;

/**
 * ģ�⣨SF0006�������˿��ѯ
 * @author: zhuning090
 */
public class DemoSF0006 {	
	public static void main(String[] args) throws CsiiException {
		com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
		com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
		com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
		
		input.put("masterId","2000311146");  //�̻��ţ�ע������������Ҫ�滻���̻��Լ��������̻���
	    input.put("beginDate","20170601000000");  //��ѯ��ʼʱ�䣨�˿��������ʱ�䣩YYYYMMDDHHMMSS
	    input.put("endDate","20170624240000");  //��ѯ����ʱ�䣨�˿��������ʱ�䣩YYYYMMDDHHMMSS
	    
	    try {
	    	output = util.execute(input,"SF0006"); //ִ�з��ͣ�SF0006�������˿��ѯ���󣬲����ؽ������
			String errorCode = (String)output.getDataValue("errorCode");
			String errorMsg = (String)output.getDataValue("errorMsg");
			
			System.out.println("---�����˿��ѯ�����ϸ��Ϣ---"+output);
			
			if((errorCode == null || errorCode.equals(""))&& (errorMsg == null || errorMsg.equals(""))){
				System.out.println("---�ܽ��---"+output.getDataValue("sumAmount"));
				System.out.println("---�ܱ���---"+output.getDataValue("sumCount"));
				com.ecc.emp.data.IndexedCollection orderList = (com.ecc.emp.data.IndexedCollection) output.getDataElement("iOrderListDetail");
				for(int i=0;i<orderList.size();i++){
					com.ecc.emp.data.KeyedCollection orderDetail = (com.ecc.emp.data.KeyedCollection) orderList.getElementAt(i);
				    System.out.print("---�̻���---"+orderDetail.getDataValue("masterId"));
				    System.out.print("---�˿��---"+orderDetail.getDataValue("refundNo"));
				    System.out.print("---ԭ������---"+orderDetail.getDataValue("orderId"));
				    System.out.print("---�˿��������ʱ��---"+orderDetail.getDataValue("refundTime"));
				    System.out.print("---����---"+orderDetail.getDataValue("currency"));
				    System.out.print("---�˿���---"+orderDetail.getDataValue("refundAmt"));
					System.out.print("---�˿�״̬---"+orderDetail.getDataValue("refundStatus"));  //01�ɹ���02ʧ�ܣ�00������
				    System.out.print("---�˿����ձ�־---"+orderDetail.getDataValue("settleflg"));  //0��δ�ۿ1���ѿۿ2���ۿ���
				    System.out.print("---�˿�ʧ�ܱ����˻���־---"+orderDetail.getDataValue("refundFlag"));  //0��δ�˿1�����˿2��������
				    System.out.print("---������---"+orderDetail.getDataValue("errorCode"));  //1�����㣬0������
				    System.out.println("---����˵��---"+orderDetail.getDataValue("errorMsg"));
				}
			}else{
				System.out.println("---������---"+output.getDataValue("errorCode"));
				System.out.println("---����˵��---"+output.getDataValue("errorMsg"));
			}
	    }catch (Exception e) {
			e.printStackTrace();
		 }
	}
}
