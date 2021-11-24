package co.lsj.bootstrap.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.lsj.bootstrap.comm.Command;
import co.lsj.bootstrap.member.service.MemberService;
import co.lsj.bootstrap.member.service.MemberVO;
import co.lsj.bootstrap.member.serviceImpl.MemberServiceImpl;


public class MemberIdCheck implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 아이디 중복체크(Ajax이용)
		MemberService memberDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setId(request.getParameter("chkid")); // ajax에서 넘겨준 변수이름
        boolean b = memberDao.memberIdCheck(vo);
		String chk = "0";
		if (b) {
			chk = "1";
		}
		
		return "ajax:" + chk;
	}

}
