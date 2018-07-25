package com.pos.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pos.orm.DBBuilder;

public class MenuDAO 
{

	private static String namespace ="com.pos.mapper.MenuMapper";
	private SqlSession sql;
	public MenuDAO()
	{
		new DBBuilder();
		sql = DBBuilder.getFactory().openSession();
	}
	public MenuVO getMenu(String name) {
		return sql.selectOne(namespace+".getMenu",name);
	}
	public List<MenuVO> getMenuList() throws SQLException{
		return sql.selectList(namespace+".getMenuList");
	}
	public int getMenuCount(String mNum) throws SQLException{

		return sql.selectOne(namespace+".getMenuCount",mNum);
	}
	public void insertMenu(MenuVO mvo) throws SQLException{

		sql.insert(namespace+".insertMenu",mvo);
		sql.commit();
	}
	public void deleteMenu(String mNum) throws SQLException
	{
		sql.delete(namespace+".deleteMenu",mNum);
		sql.commit();
	}
	public void updateMenu(MenuVO mvo) {
		sql.update(namespace+".updateMenu",mvo);
		sql.commit();
	}
}
