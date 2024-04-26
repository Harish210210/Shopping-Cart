package Store;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

public class CategoryServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GetCategories gc = new GetCategories();
		ArrayList<String> al = gc.getCateList();
		JSONArray jsonArray = new JSONArray();
		for (String st : al) {
			JSONObject obj = new JSONObject();
			obj.put("pcatname", st);
			jsonArray.put(obj);
		}
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(jsonArray.toString());
	}

}
