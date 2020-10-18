package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Contact;
import utils.DBConnectionUtil;

public class ContactDAO extends AbstractDAO {

	public int addItem(Contact item) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO contacts (name, email, website, message) VALUE  (?, ?, ?, ?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setString(2, item.getEmail());
			pst.setString(3, item.getWebsite());
			pst.setString(4, item.getMessage());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return result;
	}

	public List<Contact> findAll() {
		List<Contact> listContact=new ArrayList<>();
		con=DBConnectionUtil.getConnection();
		String sql="SELECT * FROM contacts ORDER BY id DESC";
		try {
			st=con.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				Contact cont= new Contact(rs.getInt("id"), rs.getString("name"), rs.getString("website"), rs.getString("email"), rs.getString("message"));
				listContact.add(cont);
			} ;
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return listContact;
	}

}
