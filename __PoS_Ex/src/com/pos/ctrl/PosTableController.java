package com.pos.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.pos.service.MemberDAO;
import com.pos.service.MemberVO;
import com.pos.service.MenuDAO;
import com.pos.service.MenuVO;
import com.pos.service.Paging;
import com.pos.service.PosTableDAO;
import com.pos.service.PosTableVO;

@WebServlet("/pCtrl")
public class PosTableController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Logger logger = LoggerFactory.getLogger(PosTableController.class);

    public PosTableController() {
    	
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		logger.info("PosTableCOntroller Start");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String status = request.getParameter("status");
		String flag = request.getParameter("flag");
		System.out.println("flag is " + flag);
		System.out.println("status is " + status);
		PosTableDAO pdao1 = new PosTableDAO();
		
		String status1 = pdao1.getStatus(1);
		String status2 = pdao1.getStatus(2);
		String status3 = pdao1.getStatus(3);
		String status4 = pdao1.getStatus(4);
		String status5 = pdao1.getStatus(5);
		String status6 = pdao1.getStatus(6);
		String status7 = pdao1.getStatus(7);
		String status8 = pdao1.getStatus(8);
		String status9 = pdao1.getStatus(9);
		
		request.setAttribute("status1",status1);
		request.setAttribute("status2",status2);
		request.setAttribute("status3",status3);
		request.setAttribute("status4",status4);
		request.setAttribute("status5",status5);
		request.setAttribute("status6",status6);
		request.setAttribute("status7",status7);
		request.setAttribute("status8",status8);
		request.setAttribute("status9",status9);
		
		if (flag == null)
			flag = "999";
		
		logger.info(status);
		
		MenuDAO mdao = new MenuDAO();
		if (flag.equals("0"))
		{
			logger.info(">>>>>>>>>>>>>>>>   flag0 start !");
			int tNum = Integer.parseInt(request.getParameter("tNum"));
			status= "empty";
			logger.info("tNum is : " + tNum);
			
			PosTableVO pvo = new PosTableVO(tNum,status);
			PosTableDAO pdao = new PosTableDAO();
			pdao.reset(pvo);
			request.setAttribute("tNum", tNum);
			request.setAttribute("status",status);
			RequestDispatcher rqd = request.getRequestDispatcher("./pCtrl?status=empty&flag=1&tNum="+tNum);
			rqd.forward(request, response);
			
		}
		else if (flag.equals("1"))
		{
			logger.info(">>>>>>>>>>>>>>>>>>>>>>>테이블 상태 flag1 start !");
			int tNum = Integer.parseInt(request.getParameter("tNum"));
			logger.info("tNum is : " +request.getParameter("tNum"));
			logger.info("status is : " + status);
			logger.info("flag 1  : " + flag);
			request.setAttribute("tNum", tNum);
			request.setAttribute("status",status);
			PosTableVO pvo = new PosTableVO(tNum,status);
			PosTableDAO pdao = new PosTableDAO();
			try {
				pdao.updatePosTable(pvo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(tNum == 1)request.setAttribute("status1", status);
			else if(tNum == 2)request.setAttribute("status2", status);
			else if(tNum == 3)request.setAttribute("status3", status);
			else if(tNum == 4)request.setAttribute("status4", status);
			else if(tNum == 5)request.setAttribute("status5", status);
			else if(tNum == 6)request.setAttribute("status6", status);
			else if(tNum == 7)request.setAttribute("status7", status);
			else if(tNum == 8)request.setAttribute("status8", status);
			else if(tNum == 9)request.setAttribute("status9", status);
			
			if(status.equals("use") || status.equals("order") )
			{
				List<PosTableVO> ptList = null;
				try {
					logger.info("pdao.getPosTableList(tNum) 성공 ");
					ptList = pdao.getPosTableList(tNum);
				} catch (SQLException e) {
					logger.info("pdao.getPosTableList(tNum) 실패 ");
					e.printStackTrace();
				}
				request.setAttribute("ptList", ptList);
				
				RequestDispatcher rqd = request.getRequestDispatcher("index.jsp?destPage=tableInfo");
				rqd.forward(request, response);
			}
			else
			{
				RequestDispatcher rqd = request.getRequestDispatcher("index.jsp?destPage=statusSelect");
				rqd.forward(request, response);
			}
		}
		else if(flag.equals("2"))
		{
			logger.info(">>>>>>>>>>>>>>>>>>>>>>>flag2 insertOrder start !");
			int tNum = Integer.parseInt(request.getParameter("tNum"));
			String name= request.getParameter("name");
			PosTableVO pvo = null;
			PosTableDAO pdao = new PosTableDAO();
			 mdao = new MenuDAO();
			
			pvo = new PosTableVO(name,tNum);
			
			int check = pdao.checkMenu(pvo);
			if(check == 0)
			{
				try {
					logger.info("insertOrder started!!!!!!");
					pvo =new PosTableVO(tNum,status,mdao.getMenu(name));
					pdao.insertOrder(pvo);
				} catch (SQLException e) {
					logger.info("insertOrder failed!!!!!!");
					e.printStackTrace();
				}
			}
			else
			{
				try {
					logger.info("pdao.updateCount(name); 성공");
					pdao.updateCount(name);
				} catch (SQLException e) {
					logger.info("pdao.updateCount(name); 실패애ㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐ");
					e.printStackTrace();
				}
			}
			logger.info("tNum is : " +tNum);
			logger.info("status is : " + status);
			request.setAttribute("tNum", tNum);
			request.setAttribute("status",status);
			RequestDispatcher rqd = request.getRequestDispatcher("./pCtrl?flag=3&tNum="+tNum);
			rqd.forward(request, response);
		}
		else if(flag.equals("3"))
		{
					
			logger.info("메뉴 불러오기 ~~~~~~~~시작");
			
			int cPage = request.getParameter("cPage") != null ?
					Integer.parseInt(request.getParameter("cPage")) : 1 ;
					int total=0;
					PosTableDAO pdao = new PosTableDAO();
					try
					{
						total=pdao.getTotal();
						logger.info("pdao.getTotal()");
					}
					catch(SQLException e1)
					{
						logger.info("pdao.getTotal()"); 
						e1.printStackTrace();
					}
					Paging paging = null;
					List<PosTableVO> pList = null;
					List<PosTableVO> subList = null;
					List<PosTableVO> drinkList = null;
					List<PosTableVO> etcList = null;
					try
					{
						paging=new Paging(cPage,total);
						pList = pdao.getMainList(paging);
						subList = pdao.getSubList(paging);
						drinkList = pdao.getDrinkList(paging);
						etcList = pdao.getEtcList(paging);
						logger.info("getPosTableList(paging) 성공");
					}
					catch(SQLException e)
					{
						logger.info("getPosTableList(paging) failed");
						e.printStackTrace();
					}
					System.out.println("status is : " + status);
					int tNum = Integer.parseInt(request.getParameter("tNum"));
					List<PosTableVO> ptList = null;
					try {
						logger.info("pdao.getPosTableList(tNum) 성공 ");
						ptList = pdao.getPosTableList(tNum);
					} catch (SQLException e) {
						logger.info("pdao.getPosTableList(tNum) 실패 ");
						e.printStackTrace();
					}
					request.setAttribute("ptList", ptList);
					request.setAttribute("paging",paging);
					request.setAttribute("pList",pList);
					request.setAttribute("subList",subList);
					request.setAttribute("drinkList",drinkList);
					request.setAttribute("etcList",etcList);
					request.setAttribute("status",status);
					request.setAttribute("tNum",Integer.parseInt(request.getParameter("tNum")));
					RequestDispatcher rqd = request.getRequestDispatcher("index.jsp?destPage=tableInfo");
					rqd.forward(request, response);
		}
		else if(flag.equals("4"))
		{
			logger.info(">>>>>>>>>>>>>>>>>>>>>>>flag 4 start !");
			int tNum = Integer.parseInt(request.getParameter("tNum"));
			logger.info("tNum is : " +tNum);
			
			PosTableVO pvo = new PosTableVO(tNum,status);
			PosTableDAO pdao = new PosTableDAO();
			
			try {
				pdao.updatePosTable(pvo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("tNum", tNum);
			request.setAttribute("status", status);
			if(tNum == 1)request.setAttribute("status1", status);
			else if(tNum == 2)request.setAttribute("status2", status);
			else if(tNum == 3)request.setAttribute("status3", status);
			else if(tNum == 4)request.setAttribute("status4", status);
			else if(tNum == 5)request.setAttribute("status5", status);
			else if(tNum == 6)request.setAttribute("status6", status);
			else if(tNum == 7)request.setAttribute("status7", status);
			else if(tNum == 8)request.setAttribute("status8", status);
			else if(tNum == 9)request.setAttribute("status9", status);
			
			
			RequestDispatcher rqd = request.getRequestDispatcher("index.jsp?status="+status+"&destPage=statusSelect");
			rqd.forward(request, response);
		}
		
		else if (flag.equals("5"))
		{
			int tNum = Integer.parseInt(request.getParameter("tNum"));
			logger.info(">>>>>>>>>>>>>>>메뉴 삭제 flag 5 start !");
			status = request.getParameter("status");
			String name = request.getParameter("name");
			PosTableDAO pdao = new PosTableDAO();
			pdao.deleteMenu(name);
			
			int cPage = request.getParameter("cPage") != null ?
					Integer.parseInt(request.getParameter("cPage")) : 1 ;
					int total=0;
					try
					{
						total=pdao.getTotal();
						logger.info("pdao.getTotal()");
					}
					catch(SQLException e1)
					{
						logger.info("pdao.getTotal()"); 
						e1.printStackTrace();
					}
					Paging paging = null;
			List<PosTableVO> pList = null;
			List<PosTableVO> ptList = null;
			List<PosTableVO> subList = null;
			List<PosTableVO> drinkList = null;
			List<PosTableVO> etcList = null;
			
			try {
				logger.info("pdao.getPosTableList(tNum) 성공 ");
				paging=new Paging(cPage,total);
				ptList = pdao.getPosTableList(tNum);
				pList = pdao.getMainList(paging);
				subList = pdao.getSubList(paging);
				drinkList = pdao.getDrinkList(paging);
				etcList = pdao.getEtcList(paging);
				
			} catch (SQLException e) {
				logger.info("pdao.getPosTableList(tNum) 실패 ");
				e.printStackTrace();
			}
			
			request.setAttribute("pList", pList);
			request.setAttribute("paging",paging);
			request.setAttribute("ptList", ptList);
			request.setAttribute("tNum", tNum);
			request.setAttribute("status", status);
			request.setAttribute("subList",subList);
			request.setAttribute("drinkList",drinkList);
			request.setAttribute("etcList",etcList);
			RequestDispatcher rqd = request.getRequestDispatcher("index.jsp?destPage=tableInfo&status=use");
			rqd.forward(request, response);
		}
		else if (flag.equals("6"))
		{
			logger.info(">>>>>>>>>>>>>>>로그인 flag 6 start !");
			int tNum = Integer.parseInt(request.getParameter("tNum"));
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			MemberVO mvo =new MemberVO();
			mvo.setId(id);
			mvo.setPw(pw);
			MemberDAO mbdao = new MemberDAO();
			int count =0;
			System.out.println("id is" + id);
			System.out.println("pw is" + pw);
			try
			{
				count = mbdao.checkMember(mvo);
				System.out.println("count is : " +count);
				if(count >0)
				{
					mvo =mbdao.getMember(id);
					id = mvo.getId();
					int grade = mvo.getGrade();
					
					HttpSession session = request.getSession();
					session.setAttribute("id", id);
					session.setAttribute("grade",grade);
					logger.info("grade is : " + grade);
					logger.info(">>> logins Success");	

					request.setAttribute("tNum", tNum);
					request.setAttribute("status",status);
				}
				else
				{
					logger.info(">>> logins Failed");					
				}
			}
			catch (Exception e) 
			{
				logger.info(">>mdao.checkMember(mvo) Failed <<");
				e.printStackTrace();
				}
			RequestDispatcher rqd = request.getRequestDispatcher("index.jsp?destPage=statusSelect");
			rqd.forward(request, response);
		}
		else if(flag.equals("7"))
		{
			logger.info(">>>>>>>>> adminPage MenuList<<<<<<<<");
			List<MenuVO> mList = null;
			try {
				mList = mdao.getMenuList();
				logger.info(">>> getMenuList 성공");
			} catch (SQLException e) {
				logger.info(">>> getMenuList 실패");
				e.printStackTrace();
			}
			request.setAttribute("mList", mList);
			RequestDispatcher rqd = request.getRequestDispatcher("admin.jsp?destPage=menuList");
			rqd.forward(request, response);
		}
		else if(flag.equals("8"))
		{
			logger.info(">>>>>>>>> MenuInsert flag 8 <<<<<<<<");
			int tNum = Integer.parseInt(request.getParameter("tNum"));
			String mNum = request.getParameter("mNum");
			logger.info("mNum is :" + mNum);
			String name = request.getParameter("name");
			int price = Integer.parseInt(request.getParameter("price"));
			int count;
			try {
				count = mdao.getMenuCount(mNum);
				if (count <10)
					{
						mNum = mNum+"0"+Integer.toString(count+1);
					}
				else
					{
						mNum = mNum + (count+1);
					}
				logger.info(">>>>>>>>> mdao.getMenuCount(mNum); 성공 <<<<<<<<");
			} catch (SQLException e) {
				logger.info(">>>>>>>>> mdao.getMenuCount(mNum); 실패<<<<<<<<");
				e.printStackTrace();
			}
			MenuVO mvo = new MenuVO(mNum,name,price);
			try {
				mdao.insertMenu(mvo);
				logger.info(">>>>>>>>> MenuInsert 성공<<<<<<<<");
			} catch (SQLException e) {
				logger.info(">>>>>>>>> MenuInsert 실패 <<<<<<<<");
				e.printStackTrace();
			}
			request.setAttribute("tNum", tNum);
			RequestDispatcher rqd = request.getRequestDispatcher("./pCtrl?flag=7");
			rqd.forward(request, response);
		}
		else if(flag.equals("9"))
		{
			logger.info(">>>>>>>>>관리자 page MenuDelete flag 9 <<<<<<<<");
			String mNum = request.getParameter("mNum");
			try {
				mdao.deleteMenu(mNum);
				logger.info("mdao.deleteMenu(mNum); 성공");
			} catch (SQLException e) {
				logger.info("mdao.deleteMenu(mNum); 실패");
				e.printStackTrace();
			}
			RequestDispatcher rqd = request.getRequestDispatcher("./pCtrl?flag=7");
			rqd.forward(request, response);
		}
		else if(flag.equals("10"))
		{
			logger.info(">>>>>>>>> adminPage MemberList<<<<<<<<");
			List<MemberVO> mList = null;
			MemberDAO mbdao = new MemberDAO();
			try {
				mList = mbdao.getMemberList();
				logger.info(">>> getMemberList() 성공");
			} catch (SQLException e) {
				logger.info(">>> getMemberList() 실패");
				e.printStackTrace();
			}
			request.setAttribute("mList", mList);
			logger.info("request.setAttribute(\"pList\", pList); 성공 : " + mList);
			RequestDispatcher rqd = request.getRequestDispatcher("admin.jsp?destPage=memberList");
			rqd.forward(request, response);
		}
		else if(flag.equals("11"))
		{
			logger.info(">>>>>>>>> Delete Member 시작<<<<<<<<");
			
			String id = request.getParameter("id");
			MemberDAO mbdao = new MemberDAO();
			try {
				mbdao.deleteMember(id);
				logger.info("mdao.deleteMenu(mNum); 성공");
			} catch (SQLException e) {
				logger.info("mdao.deleteMenu(mNum); 실패");
				e.printStackTrace();
			}
			RequestDispatcher rqd = request.getRequestDispatcher("./pCtrl?flag=10");
			rqd.forward(request, response);
		}
		else if(flag.equals("12"))
		{
			logger.info(">>>>>>>>> insert Member 시작<<<<<<<<");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			int grade = Integer.parseInt(request.getParameter("grade"));
			
			MemberVO mbvo = new MemberVO(id,pw,grade);
			MemberDAO mbdao = new MemberDAO();
			try {
				mbdao.insertMember(mbvo);
				logger.info("mbdao.insertMember(mbvo); 성공 ");
			} catch (SQLException e) {
				logger.info("mbdao.insertMember(mbvo); 실패 ");
				e.printStackTrace();
			}
			
			RequestDispatcher rqd = request.getRequestDispatcher("./pCtrl?flag=10");
			rqd.forward(request, response);
		}
		else if(flag.equals("13"))
		{
			logger.info("id check : flag is " + flag);
			String id = request.getParameter("id");
			int result = 0;
			MemberDAO mbdao = new MemberDAO();
			try {
				result = mbdao.checkId(id);
			} catch (SQLException e) {
				logger.info("id check Failed!!!!!!!!!!!!!!");
				e.printStackTrace();
			}
			PrintWriter out = response.getWriter();
			out.print(result);
		}
		else if(flag.equals("14"))
		{
			logger.info("menu Modify : flag is " + flag);
			String mNum = request.getParameter("mNum");
			String name = request.getParameter("name");
			int price = Integer.parseInt(request.getParameter("price"));
			
			MenuVO mvo = new MenuVO(mNum,name,price);
			mdao.updateMenu(mvo);
			
			RequestDispatcher rqd = request.getRequestDispatcher("./pCtrl?flag=7");
			rqd.forward(request, response);
		}
		else if(flag.equals("15"))
		{
			logger.info("member Modify : flag is " + flag);
			String id = request.getParameter("id");
			String pwd = request.getParameter("pw");
			int grade = Integer.parseInt(request.getParameter("grade"));
			
			MemberVO mvo = new MemberVO(id,pwd,grade);
			MemberDAO mbdao = new MemberDAO();
			try {
				mbdao.updateMember(mvo);
				logger.info("mbdao.updateMember(mvo); 성공");
			} catch (SQLException e) {
				logger.info("mbdao.updateMember(mvo); 실패");
				e.printStackTrace();
			}
			
			RequestDispatcher rqd = request.getRequestDispatcher("./pCtrl?flag=10");
			rqd.forward(request, response);
					
		}
		
		else if(flag.equals("16"))
		{
			logger.info("sales Sum : flag is " + flag);
			int year = Integer.parseInt(request.getParameter("year"));
			int month = Integer.parseInt(request.getParameter("month"));
			int day = Integer.parseInt(request.getParameter("day"));
			int sum = 0;
			String mNum = request.getParameter("mNum");
			String name ="";
			PosTableVO pvo = new PosTableVO(year,month,day,mNum,name);
			PosTableDAO pdao =new PosTableDAO();
			List<PosTableVO> pList = null;
			try {
				
				if (day == 0)
				{
					pList = pdao.sumMonth(pvo);
					request.setAttribute("pList", pList);
					logger.info("request.setAttribute(\"pList\", pList) 성공 ");
				}
				else
				{
					sum = pdao.sumSales(pvo);
					request.setAttribute("price", sum);
					logger.info("request.setAttribute(\"price\", sum); 성공 ");
				}
				
				logger.info("sum is : " + sum);
				logger.info("day is : " + day);
			} catch (SQLException e) {
				logger.info("sdao.sumSales(svo) 실패");
				e.printStackTrace();
			}
			
			request.setAttribute("year", year);
			request.setAttribute("month", month);
			request.setAttribute("day", day);
			
			RequestDispatcher rqd = request.getRequestDispatcher("admin.jsp?destPage=sales");
			rqd.forward(request, response);
		}
		else if(flag.equals("17"))
		{
			logger.info("로그아웃 성공  : flag is " + flag);
			HttpSession session = request.getSession();
			session.invalidate();
			RequestDispatcher rqd = request.getRequestDispatcher("index.jsp");
			rqd.forward(request, response);
		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		service(request, response);	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		service(request, response);
	}	
}
