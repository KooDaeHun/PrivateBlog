package kr.co.daegu.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import javafx.scene.control.Alert;


@WebServlet("*.member")
public class MemberFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberDTO memberDTO;
	private MemberDAO memberDAO;
	private ArrayList<MemberDTO> memberList;
	public MemberFrontController() {
		memberDTO = new MemberDTO();
		memberDAO = new MemberDAO();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		if(command.equals("/login.member")) {//ȸ������
			String id=request.getParameter("id");
			String pw=request.getParameter("pw");
			String pwch=request.getParameter("pwch");
			String irum=request.getParameter("irum");
			String nickname=request.getParameter("nickName");
			String email=request.getParameter("email");
			String emailcheck=request.getParameter("emailcheck");
			String smscheck=request.getParameter("smscheck");
			memberDTO.setId(id);
			memberDTO.setPw(pw);
			memberDTO.setPwch(pwch);
			memberDTO.setIrum(irum);
			memberDTO.setNickname(nickname);
			memberDTO.setEmail(email);
			memberDTO.setEmailcheck(emailcheck);
			memberDTO.setSmscheck(smscheck);
			int cnt = memberDAO.memberInsert(memberDTO);
			if(cnt == 1) {
				out.print("ȸ�������� ��ϵǾ����ϴ�.<br>");
			} else {
				out.print("ȸ�����Կ� �����߽��ϴ�.<br>");
			}
			out.print("<a href='index.jsp'>��������</a>");
		}//ȸ������
		else if(command.equals("/idcheck.member")) {//id�ߺ�����
			String id=request.getParameter("id");
			memberDTO.setId(id);
			boolean idcheck=memberDAO.memberIdCheck(memberDTO);
			if(idcheck==true) {
				out.print("���̵� �̹� ������Դϴ�.");
			}else {
				out.print("���̵� ��밡���մϴ�.");
			}
			out.print("<input type='button' value='����' onClick='self.close()'>");
		}//id�ߺ�����
		else if(command.equals("/idsearch.member")) {//���̵�ã��
			String irum = request.getParameter("irum");
			String email = request.getParameter("email");
			memberDTO.setIrum(irum);
			memberDTO.setEmail(email);
			String id=memberDAO.memberIdSearch(memberDTO);
			if(id==null) {
				out.print("�̸��̳� �̸����� �߸��Ǿ����ϴ�.");
			}else {
				out.print("ã���ô� ���̵��="+id);
			}
			out.print("<input type='button' value='����' onclick='self.close()'>");
		}//���̵�ã��
		else if(command.equals("/pwsearch.member")) {//��й�ȣã��
			String id = request.getParameter("id");
			String irum = request.getParameter("irum");
			String email = request.getParameter("email");
			memberDTO.setId(id);
			memberDTO.setIrum(irum);
			memberDTO.setEmail(email);
			String pw=memberDAO.memberPwSearch(memberDTO);
			if(pw==null) {
				out.print("���̵��̸��̳��̸����� �߸��Ǿ����ϴ�.");
			}else {
				out.print("ã���ô� ��й�ȣ��="+pw);
			}
			out.print("<input type='button' value='����' onclick='self.close()'>");
		}//��й�ȣã��
		else if(command.equals("/loginform.member")) {//�α�������
			HttpSession session = request.getSession(); 
			String id=request.getParameter("id");
			String pw=request.getParameter("pw");
			memberDTO.setId(id);
			memberDTO.setPw(pw);
			boolean login=memberDAO.memberLogin(memberDTO);
			if(login==true) {
				session.setAttribute("id", id);
				response.sendRedirect("index.jsp");
			}else {
				response.sendRedirect("index.jsp?page=loginform");
			}
		}//�α�������
		else if(command.equals("/logout.member")) {//�α׾ƿ�
			HttpSession session = request.getSession(false);
			session.removeAttribute("id");
			response.sendRedirect("index.jsp?page=logout");
		}//�α׾ƿ�
		else if(command.equals("/update.member")) {//�������
			String id=request.getParameter("id");
			String pw=request.getParameter("pw");
			String pwch=request.getParameter("pwch");
			String irum=request.getParameter("irum");
			String nickname=request.getParameter("nickname");
			String email=request.getParameter("email");
			memberDTO.setId(id);
			memberDTO.setPw(pwch);
			memberDTO.setPwch(pwch);
			memberDTO.setIrum(irum);
			memberDTO.setNickname(nickname);
			memberDTO.setEmail(email);
			memberDAO.memberUpdate(memberDTO);
			out.print("ȸ�������� �����Ǿ����ϴ�.");
			out.print("<a href='index.jsp'>��������</a>");
		}//�������
		else if(command.equals("/leave.member")) {//ȸ��Ż��
			HttpSession session = request.getSession(false);
			String id=(String)session.getAttribute("id");
			memberDTO.setId(id);
			memberDAO.memberLeave(memberDTO);
			session.removeAttribute("id");
			out.print("ȸ��Ż�� �ȳ���������");
			out.print("<a href='index.jsp'>��������</a>");			
		}//ȸ��Ż��
		else if(command.equals("/updateconfirm.member")) {//�������view
			HttpSession session = request.getSession(false);
			String id = (String) session.getAttribute("id");
			memberDTO.setId(id);
			memberDTO=memberDAO.memberUpdateView(memberDTO);
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=memberupdate");
			request.setAttribute("memberDTO", memberDTO);
			dis.forward(request, response);
		}//�������view
		else if(command.equals("/list.member")) {//�������Ʈ
			 memberList=memberDAO.memberList(memberDTO);
			 RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=memberlist");
			 request.setAttribute("memberList", memberList);
			 dis.forward(request, response);
		}//�������Ʈ
	}

}
