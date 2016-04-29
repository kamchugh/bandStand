package entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="COMMENTS")
public class Comment {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)

	private int id;
	private int artist_id;
	private String body;
}
