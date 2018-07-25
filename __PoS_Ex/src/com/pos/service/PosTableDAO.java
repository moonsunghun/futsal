package com.pos.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pos.orm.DBBuilder;

public class PosTableDAO {

	private static String namespace ="com.pos.mapper.posTableMapper";
	private SqlSession sql;
	public PosTableDAO()
	{
		new DBBuilder();
		sql = DBBuilder.getFactory().openSession();
	}
	
	public List<PosTableVO> getMainList(Paging paging) throws SQLException{
		return sql.selectList(namespace+".getMainList",paging);
	}
	public int getTotal() throws SQLException{
		return sql.selectOne(namespace+".getTotal");
	}
	public void updatePosTable(PosTableVO pvo) throws SQLException{
		sql.update(namespace+".updateStatus",pvo);
		sql.commit();
		sql.close();
		System.out.println("updatePosTable DAO 종료 !!  ");
	}

	public String getStatus(int tNum) {
		
		return sql.selectOne(namespace+".getStatus",tNum);
	}

	public void insertOrder(PosTableVO pvo) throws SQLException{
		sql.insert(namespace+".insertOrder",pvo);
		sql.commit();
		System.out.println("insertOrder(PosTableVO pvo) 종료 !!  ");
		
	}
	public List<PosTableVO> getPosTableList(int tNum) throws SQLException {
		sql = DBBuilder.getFactory().openSession();
		return sql.selectList(namespace+".getPosTableList",tNum);
	}

	public int checkMenu(PosTableVO pvo) {
		return sql.selectOne(namespace+".checkMenu",pvo);
	}

	public void updateCount(String name) throws SQLException {

		sql.update(namespace+".updateCount",name);
		sql.commit();
		sql.close();
		System.out.println("updateCount DAO 종료 !!  ");
	}

	public List<PosTableVO> getSubList(Paging paging) throws SQLException{
		return sql.selectList(namespace+".getSubList",paging);
	}

	public List<PosTableVO> getDrinkList(Paging paging) throws SQLException{
		return sql.selectList(namespace+".getDrinkList",paging);
	}

	public List<PosTableVO> getEtcList(Paging paging) throws SQLException{
		return sql.selectList(namespace+".getEtcList",paging);
	}

	public void deleteMenu(String name) {

		sql.delete(namespace+".deleteMenu",name);
		sql.commit();
	}

	public void reset(PosTableVO pvo)
	{
		sql.close();
		sql = DBBuilder.getFactory().openSession();
		sql.update(namespace+".reset",pvo);
		sql.update(namespace+".updateStatus",pvo);
		sql.commit();
		sql.close();
	}

	public int sumSales(PosTableVO pvo) throws SQLException{
		if (sql.selectOne(namespace+".sumSales",pvo) == null)
			return 0;
		else 
			return sql.selectOne(namespace+".sumSales",pvo);
		 
	}
	public List<PosTableVO> sumMonth(PosTableVO pvo) {
		return sql.selectList(namespace+".sumMonth",pvo);
	}

	public List<PosTableVO> getMenuList(String mNum) throws SQLException
	{
		return sql.selectList(namespace+".getMenuList",mNum);
	}
	
}
