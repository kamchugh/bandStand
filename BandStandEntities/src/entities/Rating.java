package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "rating")
class Rating {
	@Id
	@GeneratedValue
	private int id;

	private int number;

	@ManyToOne
	@Column(name = "artist_id")
	private int artistId;

	@ManyToOne
	@Column(name = "user_id")
	private int userId;

	public Rating() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Rating [id=" + id + ", number=" + number + ", artistId=" + artistId + ", userId=" + userId + "]";
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

	public int getArtistId() {
		return artistId;
	}

	public void setArtistId(int artistId) {
		this.artistId = artistId;
	}

	public int getUserId() {
		return userId;
	}

}
