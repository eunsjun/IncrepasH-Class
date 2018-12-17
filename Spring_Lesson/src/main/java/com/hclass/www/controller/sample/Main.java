package com.hclass.www.controller.sample;

import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		/*
		 * 원래 Web 스프링에서는 필요없는 기능이지만
		 * 지금은 어플리케이션 처리 확인을 위해서 임시적으로 사용하는 함수다.
		 * 
		 * 해야될 일
		 * 		xml 읽어야 한다.
		 */
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationContext.xml");
		
		// bean 처리된 클래스를 찾아온다.
		Greeter g1 = ctx.getBean("greeter", Greeter.class);
		Greeter g2 = ctx.getBean("greeter", Greeter.class);
		
		String msg1 = g1.greet("스프링");
		String msg2 = g2.greet("신민재");
		System.out.println(msg1);
		System.out.println(msg2);
		ctx.close();
		
	}

}
