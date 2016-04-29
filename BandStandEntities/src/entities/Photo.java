package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "PHOTO")
public class Photo {
	@Id
	@GeneratedValue
	private int id;

	private String url;

	@ManyToOne
	@Column(name = "artist_id")
	private int artistId;

	public Photo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getArtistId() {
		return artistId;
	}

}
