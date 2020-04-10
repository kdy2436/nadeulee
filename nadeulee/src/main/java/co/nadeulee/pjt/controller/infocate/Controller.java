package co.nadeulee.pjt.controller.infocate;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tiles.request.DispatchRequest;

public interface Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

	default void foward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		try {
			dispatcher.forward(request, response);
		} catch (Exception e) {
		}

	}
}
