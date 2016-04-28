package entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "booking")
public class Booking {
	@Id
	@GeneratedValue
	private int id;

	@Column(name = "booking_date")
	@Temporal(TemporalType.DATE)
	private Date bookingDate;

	@Column(name = "artist_id")
	@ManyToOne
	private int artistId;

	private Boolean confirmed;

	@ManyToOne
	@Column(name = "user_id")
	private int userId;

	@Override
	public String toString() {
		return "Booking [id=" + id + ", bookingDate=" + bookingDate + ", artistId=" + artistId + ", confirmed="
				+ confirmed + ", userId=" + userId + "]";
	}

	public Booking() {
		super();

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public int getArtistId() {
		return artistId;
	}

	public void setArtistId(int artistId) {
		this.artistId = artistId;
	}

	public Boolean getConfirmed() {
		return confirmed;
	}

	public void setConfirmed(Boolean confirmed) {
		this.confirmed = confirmed;
	}

	public int getUserId() {
		return userId;
	}

}
