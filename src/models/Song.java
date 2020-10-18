package models;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Song {
	private int id;
	private String name;
	private String description;
	private String detail;
	private String picture;
	private Timestamp createAt;
	private int counter;
	private Category cat;
	public Song(int id, String name, String description, String detail, String picture, Timestamp createAt,
			int counter) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.detail = detail;
		this.picture = picture;
		this.createAt = createAt;
		this.counter = counter;
	}
	public Song(String name, String description, String detail, String picture, Category cat) {
		super();
		this.name = name;
		this.description = description;
		this.detail = detail;
		this.picture = picture;
		this.cat = cat;
	}
	public Song(int id, String name, String description, String detail, String picture, Category cat) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.detail = detail;
		this.picture = picture;
		this.cat = cat;
	}
	
	
	
	
}
