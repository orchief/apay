package com.sdb.corporbank.bean;

import com.sdb.payclient.bean.exception.*;

/**
 * ģ�⣨SF0003��ÿ�ն��˵���ѯ
 * @author: zhuning090
 */
public class DemoSF0003 {	
	public static void main(String[] args) throws CsiiException {
		com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
		com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
		com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
		
		input.put("masterId","2000311146");  //�̻��ţ�ע������������Ҫ�滻���̻��Լ��������̻���
	    input.put("date","20160910");  //�������ڣ���ʽ��YYYYMMDD
	    
	    try {
	    	output = util.execute(input,"SF0003"); //ִ�з��ͣ�SF0003��ÿ�ն��˵���ѯ���󣬲����ؽ������
			String errorCode = (String)output.getDataValue("errorCode");
			String errorMsg = (String)output.getDataValue("errorMsg");
			
			System.out.println("---ÿ�ն��˵���ѯ�����ϸ��Ϣ---"+output);
			
			if((errorCode == null || errorCode.equals(""))&& (errorMsg == null || errorMsg.equals(""))){
				System.out.println("---�ܽ��---"+output.getDataValue("sumAmount"));
				System.out.println("---�ܱ���---"+output.getDataValue("sumCount"));
				com.ecc.emp.data.IndexedCollection orderList = (com.ecc.emp.data.IndexedCollection) output.getDataElement("iOrderListDetail");
				for(int i=0;i<orderList.size();i++){
					com.ecc.emp.data.KeyedCollection orderDetail = (com.ecc.emp.data.KeyedCollection) orderList.getElementAt(i);
					System.out.print("---����״̬---"+orderDetail.getDataValue("status"));
				    System.out.print("---֧�����ʱ��---"+orderDetail.getDataValue("date"));
				    System.out.print("---�����ѽ��---"+orderDetail.getDataValue("charge"));
				    System.out.print("---�̻���---"+orderDetail.getDataValue("masterId"));
				    System.out.print("---������---"+orderDetail.getDataValue("orderId"));
				    System.out.print("---����---"+orderDetail.getDataValue("currency"));
				    System.out.print("---�������---"+orderDetail.getDataValue("amount"));
				    System.out.print("---�µ�ʱ��---"+orderDetail.getDataValue("paydate"));
				    System.out.print("---��Ʒ����---"+orderDetail.getDataValue("objectName"));
				    System.out.print("---������Ч��---"+orderDetail.getDataValue("validtime"));
				    System.out.print("---��ע---"+orderDetail.getDataValue("remark"));
				    System.out.print("---���������־---"+orderDetail.getDataValue("settleflg"));  //1�����㣬0������
				    System.out.print("---��������ʱ��---"+orderDetail.getDataValue("settletime"));
				    System.out.print("---�����������־---"+orderDetail.getDataValue("chargeflg"));  //1�����㣬0������
				    System.out.println("---����������ʱ��---"+orderDetail.getDataValue("chargetime"));
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
