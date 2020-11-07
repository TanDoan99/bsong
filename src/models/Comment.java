package models;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
	private int id;
	private String name;
	private String cmt;
	private Timestamp date_send;
	private int song_id;
	public Comment(String name, String cmt, Timestamp date_send, int song_id) {
		super();
		this.name = name;
		this.cmt = cmt;
		this.date_send = date_send;
		this.song_id = song_id;
	}
	
	
}
