package Store;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class CartDetails {
	public void toCart(int pid, int qty) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection cn = DriverManager.getConnection("jdbc:postgresql://192.168.110.48/plf_training",
					"plf_training_admin", "pff123");
			Statement st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet rs = st.executeQuery("select * from h_cart where pid=" + pid);
			if (rs.next()) {
				Statement st2 = cn.createStatement();
				String qry = "update h_cart set quantity=quantity+" + qty + " where pid =" + pid;
				st.executeUpdate(qry);
			} else {
				Statement st3 = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				ResultSet rs3 = st.executeQuery("select price from h_products where pid=" + pid);
				int prc = 0;
				while (rs3.next()) {
					prc = rs3.getInt(1);
				}
				Statement st2 = cn.createStatement();
				String qry = "insert into h_cart values(" + pid + ", " + qty + ", " + prc + ")";
				st.executeUpdate(qry);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
