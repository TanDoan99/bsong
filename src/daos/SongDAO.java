package daos;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import models.Song;
import utils.DBConnectionUtil;

public class SongDAO extends AbstractDAO {

	public List<Song> findAll() {
		List<Song> listSong=new ArrayList<>();
		con=DBConnectionUtil.getConnection();
		String sql="SELECT * FROM songs ORDER BY id DESC";
		try {
			st=con.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				Song song= new Song(rs.getInt("id"),rs.getString("name") , rs.getString("preview_text"), rs.getString("detail_text"), rs.getString("picture"), rs.getTimestamp("date_create"), rs.getInt("counter"));
				listSong.add(song);
			} ;
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return listSong;
		
	}

	public List<Song> getItemIdCat(int idcat) {
		ArrayList<Song> listItems = new ArrayList<>();
		con=DBConnectionUtil.getConnection();
		try {
			String sql = "SELECT * FROM songs WHERE cat_id= ?";
			pst = con.prepareStatement(sql);
			pst.setInt(1, idcat);
			rs = pst.executeQuery();
			while (rs.next()) {
				int id=rs.getInt("id");
				String name=rs.getString("name");
				String description=rs.getString("preview_text");
				String detail=rs.getString("detail_text");
				String picture=rs.getString("picture");
				Timestamp createAt=rs.getTimestamp("date_create");
				int counter=rs.getInt("counter");
				
				Song objItems=new Song(id, name, description, detail, picture, createAt, counter);
				listItems.add(objItems);
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listItems;
	}

	public Song getDetail(int id) {
		Song objDetail = null;
		con=DBConnectionUtil.getConnection();
		try {
			String sql = "SELECT * FROM songs WHERE id= ?";
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				int idDe=rs.getInt("id");
				String name=rs.getString("name");
				String description=rs.getString("preview_text");
				String detail=rs.getString("detail_text");
				String picture=rs.getString("picture");
				Timestamp createAt=rs.getTimestamp("date_create");
				int counter=rs.getInt("counter");
				
				objDetail=new Song(idDe, name, description, detail, picture, createAt, counter);
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return objDetail;
	}

	

}
