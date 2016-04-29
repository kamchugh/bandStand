package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "RATING")
class Rating {
	@Id
	@GeneratedValue
	private int id;

	private int number;

	@ManyToOne
	@Column(name = "artist_id")
	private Artist artist;

	@ManyToOne
	@Column(name = "user_id")
	private User user;

	public Rating() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	@Override
	public String toString() {
		return "Rating [id=" + id + ", number=" + number + ", artist=" + artist + ", user=" + user + "]";
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Artist getArtist() {
		return artist;
	}

	public void setArtistId(Artist artist) {
		this.artist = artist;
	}

	public User getUser() {
		return user;
	}

}
