package com.kh.insane.chat;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Template {

	public static SqlSession getSession() {
		SqlSession session = null;
		
		InputStream stream;
		
		try {
			//stream = Resources.getResourceAsStream("resources/mybatis-config.xml");
			stream = Resources.getResourceAsStream("mybatis-config.xml");
			
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(stream);
			session = sessionFactory.openSession(false);
			
			//session = new SqlSessionFactoryBuilder().build(stream).openSession(false);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return session;
	}
}
