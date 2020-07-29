package com.tydee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tydee.dto.MyTydeeDistinctDto;
import com.tydee.dto.MyTydeeDto;
import com.tydee.mybatis.SqlMapConfig;

public class MyTydeeDao extends SqlMapConfig {
	private String namespace = "mytydee-mapper.";
	public List<MyTydeeDto> selectListLevDepth(MyTydeeDistinctDto dto){
		SqlSession session = null;
		List<MyTydeeDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectListLevDepth", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	public List<MyTydeeDistinctDto> selectListDistinct(int user_no){
		SqlSession session = null;
		List<MyTydeeDistinctDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectListDistinct", user_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	public MyTydeeDto selectOneNo(int tiny_no) {
		SqlSession session = null;
		MyTydeeDto dto = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectOneNo", tiny_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
}
