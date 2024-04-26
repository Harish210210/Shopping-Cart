package Store;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ToCartServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("pid"));
		int qty = Integer.parseInt(request.getParameter("qt"));
		CartDetails cd = new CartDetails();
		cd.toCart(pid, qty);
		response.setContentType("plain/text");
		PrintWriter out = response.getWriter();
		out.print("Success");
	}

}
