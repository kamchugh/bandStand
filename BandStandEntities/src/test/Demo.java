package test;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import entities.Artist;
import entities.Genre;
import entities.GenreType;
import entities.Photo;
import entities.User;
import entities.Rating;

public class Demo {
	public static void main(String[] args){
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("awesomebandsdb");
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Artist artist = new Artist();
		artist.setEmail("newArtistEmail@email.com");
		artist.setPassword("password");
		artist.setName("Bruno's Phat Band");
		em.persist(artist);
		em.getTransaction().commit();
		
//		Artist updateArtist = em.find(Artist.class, 5);
//		updateArtist.setDescription("This is a much better description");
//		em.getTransaction().commit();
//		
//		User userComment = em.find(User.class, 1);
//		userComment.setAccessLevel(2);
//		em.getTransaction().commit();
//		
//		Artist artistPhotos = em.find(Artist.class, 8);
//		List<Photo> photos = artistPhotos.getPhotos();
//		for (Photo photo : photos) {
//			System.out.println(photo.getArtist());
//		}
//		em.getTransaction().commit();
//		
//		Genre genre = em.find(Genre.class, 1);
//		genre.setGenretype(GenreType.Country);
//		em.getTransaction().commit();
//		
//		Rating rating = em.find(Rating.class, 1);
//		System.out.println(rating.getArtist().getName());
//		System.out.println(rating.getUser().getFirstName());
//		em.getTransaction().commit();
		
		em.close();
		emf.close();
	}

}
