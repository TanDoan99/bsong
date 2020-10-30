package daos;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import models.Category;
import models.Song;
import utils.DBConnectionUtil;
import utils.DefineUtil;

public class SongDAO extends AbstractDAO {

	public List<Song> findAllSong() {
		List<Song> listSong=new ArrayList<>();
		con=DBConnectionUtil.getConnection();
		String sql="SELECT s.*,c.name AS catName FROM songs AS s "
				+"INNER JOIN categories AS c "
				+"ON s.cat_id=c.id "
				+"ORDER BY s.id DESC";
		try {
			st=con.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				Song song= new Song(
						rs.getInt("id"),
						rs.getString("name"), 
						rs.getString("preview_text"), 
						rs.getString("detail_text"), 
						rs.getString("picture"), 
						rs.getTimestamp("date_create"), 
						rs.getInt("counter"),
						new Category(rs.getInt("cat_id"),
								rs.getString("catName")));
				listSong.add(song);
			} ;
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return listSong;
		
	}
	
	public List<Song> findAll() {
		List<Song> listSong=new ArrayList<>();
		con=DBConnectionUtil.getConnection();
		String sql="SELECT * FROM songs ORDER BY id ASC";
		try {
			st=con.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				Song song= new Song(rs.getInt("id"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getString("picture"), rs.getTimestamp("date_create"), rs.getInt("counter"));
				listSong.add(song);
			} ;
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return listSong;
		
	}
	public List<Song> findAllByIdAndNameOrderByNewsId(Song song) {
		List<Song> listSong = new ArrayList<Song>();
		con=DBConnectionUtil.getConnection();
		//String sql2 = "SELECT * FROM songs INNER JOIN categories ON categories.id = songs.cat_id WHERE 1";
		String sql="SELECT s.id, "
				+"s.name AS songName, "
				+"s.preview_text, "
				+"s.detail_text, "
				+"s.detail_text, "
				+"s.date_create, "
				+"s.picture, "
				+"s.counter, "
				+"s.cat_id, "
				+"c.name AS catName "
				+"FROM songs AS s "
				+"INNER JOIN categories AS c "
				+"ON c.id = s.cat_id WHERE 1 ";
				//+"ORDER BY s.id DESC";
		if(!"".equals(song.getName())){
			sql += " AND s.name LIKE ? ";
		}
		if(song.getCat().getId() > 0){
			sql += " AND s.cat_id = ? ";
		}
		try {
			pst=con.prepareStatement(sql);
			if(song.getCat().getId() > 0 && !"".equals(song.getName())){
				pst.setString(1, "%" +song.getName() +"%");
				pst.setInt(2, song.getCat().getId());
			}else {
				if(!"".equals(song.getName())&& song.getCat().getId()==0) {
					pst.setString(1, "%" +song.getName() +"%");
				}else if( "".equals(song.getName()) && song.getCat().getId() > 0) {
					pst.setInt(1, song.getCat().getId());
				}
			}
				
			rs=pst.executeQuery();
			while(rs.next()) {
				Song songs= new Song(
						rs.getInt("id"),
						rs.getString("songName"), 
						rs.getString("preview_text"), 
						rs.getString("detail_text"), 
						rs.getString("picture"), 
						rs.getTimestamp("date_create"), 
						rs.getInt("counter"),
						new Category(rs.getInt("cat_id"),
								rs.getString("catName")));
				listSong.add(songs);
			} 
			System.out.println(listSong.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listSong;
		
	}
	public List<Song> findNewPosts(int number) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT s.*, c.name AS cName FROM songs s JOIN categories c ON s.cat_id = c.id ORDER BY id DESC LIMIT ?";
		List<Song> listItems = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, number);
			rs = pst.executeQuery();
			while (rs.next()) {
				Song ObjItem = new Song(rs.getInt("id"), rs.getString("name"), rs.getString("preview_text"),
						rs.getString("detail_text"), rs.getString("picture"), rs.getTimestamp("date_create"),
						rs.getInt("counter"), new Category(rs.getInt("cat_id"), rs.getString("cName")));
				listItems.add(ObjItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listItems;
		
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

	public List<Song> getDetail(int id) {
		List<Song> listDetail = new ArrayList<>();
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
				Category cat=new Category(rs.getInt("cat_id"));
				
				Song obj= new Song(idDe, name, description, detail, picture, createAt, counter, cat);
				listDetail.add(obj);
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listDetail;
	}
	public int findCatIdIndex(int Songid){
		Song song = new Song();
		con=DBConnectionUtil.getConnection();
		String sql="SELECT * FROM songs WHERE id = ?";
		try {
			pst=con.prepareStatement(sql);
			pst.setInt(1, Songid);
			rs=pst.executeQuery();
			while(rs.next()) {
				song = new Song(rs.getInt("id"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getString("picture"), rs.getTimestamp("date_create"), rs.getInt("counter"), new Category(rs.getInt("cat_id"))) ;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return song.getCat().getId();
		
	}

	public int countCat() {
		int count = 0;
		con=DBConnectionUtil.getConnection();
		String sql="SELECT COUNT(id) FROM categories";
		try {
			st=con.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return count;
	}

	public int countSong() {
		int count = 0;
		con=DBConnectionUtil.getConnection();
		String sql="SELECT COUNT(id) FROM songs";
		try {
			st=con.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return count;
	}
	public int countUser() {
		int count = 0;
		con=DBConnectionUtil.getConnection();
		String sql="SELECT COUNT(id) FROM users";
		try {
			st=con.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return count;
	}

	public int add(Song song) {
		int result=0;
		con=DBConnectionUtil.getConnection();
		String sql="INSERT INTO songs (name,preview_text,detail_text,picture,cat_id) VALUE(?, ?, ?, ?, ?)";
		try {
			pst=con.prepareStatement(sql);
			pst.setString(1,song.getName());
			pst.setString(2, song.getDescription());
			pst.setString(3, song.getDetail());
			pst.setString(4, song.getPicture());
			pst.setInt(5, song.getCat().getId());
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return result;
	}

	public int numberOfItems(int catId) {
		con=DBConnectionUtil.getConnection();
		String sql="SELECT COUNT(*) AS COUNT FROM songs WHERE cat_id = ? ";
		try {
			pst=con.prepareStatement(sql);
			pst.setInt(1,catId );
			rs=pst.executeQuery();
			if(rs.next()) {
				int count=rs.getInt("count");
				return count;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return 0;
	}

	public List<Song> getItemIdCatPagination(int offset, int catId) {
		List<Song> listSong=new ArrayList<>();
		con=DBConnectionUtil.getConnection();
		String sql="SELECT s.id AS sid, s.name AS sname, preview_text, detail_text, date_create, picture, counter, 	cat_id "
				+"FROM songs AS s "
				+"INNER JOIN categories AS c ON s.cat_id = c.id "
				+"WHERE cat_id = ? "
				+"ORDER BY s.id DESC LIMIT ?, ? ";
		try {
			pst=con.prepareStatement(sql);
			pst.setInt(1, catId);
			pst.setInt(2,offset );
			pst.setInt(3, DefineUtil.NUMBER_PER_PAGE);
			rs=pst.executeQuery();
			while(rs.next()) {
				Song song= new Song(
						rs.getInt("sid"),
						rs.getString("sname"), 
						rs.getString("preview_text"), 
						rs.getString("detail_text"), 
						rs.getString("picture"), 
						rs.getTimestamp("date_create"), 
						rs.getInt("counter"),
						new Category(rs.getInt("cat_id")
								));
				listSong.add(song);
			} ;
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listSong;
	}

	public int del(int id) {
		int result=0;
		con=DBConnectionUtil.getConnection();
		String sql="DELETE FROM songs WHERE id=?";
		try {
			pst=con.prepareStatement(sql);
			pst.setInt(1,id);
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return result;
	}

	public Song findSong(int id) {
		Song song=null;
		con=DBConnectionUtil.getConnection();
		String sql="SELECT s.*,c.name AS catName FROM songs AS s "
				+"INNER JOIN categories AS c "
				+"ON s.cat_id=c.id "
				+"WHERE s.id=?";
		try {
			pst=con.prepareStatement(sql);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			if(rs.next()) {
				 song=new  Song(
						rs.getInt("id"),
						rs.getString("name"), 
						rs.getString("preview_text"), 
						rs.getString("detail_text"), 
						rs.getString("picture"), 
						rs.getTimestamp("date_create"), 
						rs.getInt("counter"),
						new Category(rs.getInt("cat_id"),
								rs.getString("catName")));
			} ;
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return song;
	}

	public int editSong(Song song) {
		int result=0;
		con=DBConnectionUtil.getConnection();
		String sql="UPDATE songs SET name = ? , preview_text = ? , detail_text = ? , picture = ? , cat_id = ? WHERE id = ? ";
		try {
			pst=con.prepareStatement(sql);
			
			pst.setString(1,song.getName());
			pst.setString(2, song.getDescription());
			pst.setString(3, song.getDetail());
			pst.setString(4, song.getPicture());
			pst.setInt(5, song.getCat().getId());
			pst.setInt(6, song.getId());
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return result;
	}

	public Song findOne(int id) {
		Song song = null;
		con=DBConnectionUtil.getConnection();
		try {
			String sql = "SELECT * FROM songs WHERE id= ?";
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
			song = new Song(rs.getInt("id"), rs.getString("name"),
					rs.getString("preview_text"), rs.getString("detail_text"),
					rs.getString("picture"), new Category(rs.getInt("cat_id")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return song;
	}

	public List<Song> getItemPagination(int offset) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT s.*, c.name AS catName FROM songs s JOIN categories c ON s.cat_id = c.id ORDER BY id DESC LIMIT ?, ?";
		List<Song> listItems = new ArrayList<>();
		try {
			pst=con.prepareStatement(sql);
			pst.setInt(1,offset );
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs=pst.executeQuery();
			while(rs.next()) {
				Song song = new Song(rs.getInt("id"), rs.getString("name"), rs.getString("preview_text"),
						rs.getString("detail_text"),rs.getString("picture"), rs.getTimestamp("date_create"), 
						rs.getInt("counter"),new Category(rs.getInt("cat_id"), rs.getString("catName")));
				listItems.add(song);
			} ;
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listItems;
	}

	public ArrayList<Song> searchSong(String s) {
		Song song = null;
		ArrayList<Song> listSong = new ArrayList<Song>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM songs WHERE name LIKE '%"+s+"%'";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				song = new Song(rs.getInt("id"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getString("picture"), rs.getTimestamp("date_create"), rs.getInt("counter"), new Category(rs.getInt("cat_id")));
				listSong.add(song);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listSong;
	}
	public int countId(int id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE songs SET counter = counter + 1 WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
