package co.lsj.bootstrap.comm.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.lsj.bootstrap.comm.Command;

public class Buttons implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 
		return "main/buttons";
	}

}
