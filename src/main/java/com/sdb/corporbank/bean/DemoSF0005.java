package com.sdb.corporbank.bean;

import com.sdb.payclient.bean.exception.*;

/**
 * ģ�⣨SF0005�����ʶ����˿�
 * @author: zhuning090
 */
public class DemoSF0005 {	
	public static void main(String[] args) throws CsiiException {
		com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
		com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
		com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
		
		int orderid ;
		String orderids;
		java.util.Random r=new java.util.Random();
		while(true){
			orderid=r.nextInt(99999999);
			if (orderid<0)orderid=-orderid;
			orderids = String.valueOf(orderid);
			if(orderids.length()<8){
				continue;
			}
			if(orderids.length()>=8){
				orderids = orderids.substring(0,8);
				break;
			}
		}
		java.util.Calendar calendar = java.util.Calendar.getInstance();
		java.util.Date date = calendar.getTime();
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat( "yyyyMMddHHmmss" );
		String timestamp = formatter.format( date );
		String datetamp = timestamp.substring(0, 8);
		
		input.put("masterId","2000311146");  //�̻��ţ�ע������������Ҫ�滻���̻��Լ��������̻���
		input.put("refundNo","2000311146"+datetamp+orderids);  //�˿�ţ��ϸ����ظ�ʽ���̻���+8λ����YYYYMMDD+8λ��ˮ
		input.put("orderId","20003111462016090928422839");  //ԭ�����ţ��ϸ����ظ�ʽ���̻���+8λ����YYYYMMDD+8λ��ˮ
		input.put("currency","RMB");  //���֣�Ŀǰֻ֧��RMB
		input.put("refundAmt","0.01");  //�˿��12������2С�����������ԭ�������
		input.put("remark","2000311146");  //��ע�ֶΣ��̻��Զ���
		input.put("objectName","�����˿�");  //�˿�ԭ���̻��Զ���
		input.put("NOTIFYURL","http://localhost:8090/khPayment_merchant_demo1/receivedemo2.jsp");  //�̻����ն����˿����������첽֪ͨ��url��֧��ƽ̨֪ͨ���У�������֪ͨ�̻�������֪ͨ
		
	    try {
	    	output = util.execute(input,"SF0005"); //ִ�з��ͣ�SF0005�����ʶ����˿����󣬲����ؽ������
			String errorCode = (String)output.getDataValue("errorCode");
			String errorMsg = (String)output.getDataValue("errorMsg");
			
			System.out.println("---���ʶ����˿�����ϸ��Ϣ---"+output);
			
			if((errorCode == null || errorCode.equals(""))&& (errorMsg == null || errorMsg.equals(""))){				
				System.out.println("---����״̬---"+output.getDataValue("status"));  //01�����ճɹ����˿��Ƿ�ɹ������첽֪ͨ���Ϊ׼��02��ʧ��
				System.out.println("---�̻���---"+output.getDataValue("masterId"));
				System.out.println("---�˿��---"+output.getDataValue("refundAmt"));
				System.out.println("---ԭ������---"+output.getDataValue("orderId"));
				System.out.println("---����---"+output.getDataValue("currency"));
				System.out.println("---�˿���---"+output.getDataValue("refundAmt"));
			}else{
				System.out.println("---������---"+output.getDataValue("errorCode"));
				System.out.println("---����˵��---"+output.getDataValue("errorMsg"));
			}

	    }catch (Exception e) {
			e.printStackTrace();
		}
	}
}
