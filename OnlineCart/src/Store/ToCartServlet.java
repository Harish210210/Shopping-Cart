package Store;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ToCartServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("pid"));
		int qty = Integer.parseInt(request.getParameter("qt"));
		HttpSession session = request.getSession();
		String cname = (String) session.getAttribute("cname");
		CartDetails cd = new CartDetails();
		cd.toCart(pid, qty, cname);
		response.setContentType("plain/text");
		PrintWriter out = response.getWriter();
		out.print("Success");
	}

}
