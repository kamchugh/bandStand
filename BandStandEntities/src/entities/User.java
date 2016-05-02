package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="USER")
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String email;
	private String password;
	@Column(name="first_name")
	private String firstName;
	@Column(name="last_name")
	private String lastName;
	@Column(name="photo_url")
	private String photoUrl;
	@Column(name="access_level")
	private int accessLevel;
	
	@OneToMany(mappedBy = "user")
	private List<Booking> bookings;

	@OneToMany(mappedBy = "user")
	private List<Rating> ratings;
	
	@OneToMany(mappedBy = "user")
	private List<Comment> comments;

	
	
	
	public void removeBookings(List<Booking> bookingsList){
		for(Booking booking: bookingsList)
			if (bookings.contains(booking)){
				bookings.remove(booking);
		}
	}
	
	
	public void removeRatings(List<Rating> ratingsList){
		for(Rating rating: ratingsList)
			if (ratings.contains(rating)){
				ratings.remove(rating);
		}
	}
	
	public void removeComments(List<Comment> commentList){
		for(Comment comment: commentList)
			if (comments.contains(comment)){
				comments.remove(comment);
		}
	}
	public User() {
		super();
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public int getAccessLevel() {
		return accessLevel;
	}

	public void setAccessLevel(int accessLevel) {
		this.accessLevel = accessLevel;
	}

	public List<Booking> getBookings() {
		return bookings;
	}

	public void setBookings(List<Booking> bookings) {
		this.bookings = bookings;
	}

	public List<Rating> getRatings() {
		return ratings;
	}

	public void setRatings(List<Rating> ratings) {
		this.ratings = ratings;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	
	
	
	
}
