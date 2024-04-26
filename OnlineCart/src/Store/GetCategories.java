package Store;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class GetCategories {
	public ArrayList<String> getCateList() {
		ArrayList<String> al = new ArrayList<>();
		try {
			Class.forName("org.postgresql.Driver");
			Connection cn = DriverManager.getConnection("jdbc:postgresql://192.168.110.48/plf_training",
					"plf_training_admin", "pff123");
			Statement st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet rs = st.executeQuery("select pcatname from h_pcategory");
			while (rs.next()) {
				al.add(rs.getString(1));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return al;
	}
}
