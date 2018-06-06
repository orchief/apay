package com.orchief.pay2.util;

public class RandomID {

	//生成8位随机数
	public static String getOrderId(){
		String orderId ;
		java.util.Random r=new java.util.Random();
		while(true){
			int i=r.nextInt(99999999);
			if(i<0)i=-i;
			orderId = String.valueOf(i);
			System.out.println("---生成随机数---"+orderId);
			if(orderId.length()<8){
				System.out.println("---位数不够8位---"+orderId);
				continue;
			}
			if(orderId.length()>=8){
				orderId = orderId.substring(0,8);
				System.out.println("---生成8位流水---"+orderId);
				break;
			}
		  }
		return orderId;
	}
}
