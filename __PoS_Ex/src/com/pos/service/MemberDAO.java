package com.pos.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pos.orm.DBBuilder;

public class MemberDAO {

	private static String namespace ="com.pos.mapper.MemberMapper";
	private SqlSession sql;
	public MemberDAO()
	{
		new DBBuilder();
		sql = DBBuilder.getFactory().openSession();
	}
	public int checkMember(MemberVO mvo) throws SQLException{
		int count = sql.selectOne(namespace+".checkMember",mvo);
		return count;
	}
	public MemberVO getMember(String id) throws SQLException {
		MemberVO mvo = new MemberVO();
		mvo = sql.selectOne(namespace+".getMember",id);
		return mvo;
	}
	public List<MemberVO> getMemberList() throws SQLException {
		return sql.selectList(namespace+".getMemberList");
	}
	public void deleteMember(String id) throws SQLException{
		sql.delete(namespace+".deleteMember",id);
		sql.commit();
	}
	public void insertMember(MemberVO mbvo) throws SQLException{
		sql.insert(namespace+".insertMember",mbvo);
		sql.commit();
		
	}
	public int checkId(String id) throws SQLException{
		int count = sql.selectOne(namespace+".checkId",id);
		return count;
	}
	public void updateMember(MemberVO mvo) throws SQLException{

		sql.update(namespace+".updateMember",mvo);
		sql.commit();
	}

}
