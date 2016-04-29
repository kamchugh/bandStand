package test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Artist;
import entities.Booking;
import entities.User;

public class TestJunit {

	private EntityManagerFactory emf;
	private EntityManager em;

	@Before
	public void setUp() throws Exception {

		emf = Persistence.createEntityManagerFactory("awesomebandsdb");
		em = emf.createEntityManager();

	}

	@Test
	public void testArtist() {

		Artist a = em.find(Artist.class, 1);
		assertEquals("HankyPanky", a.getName());
		assertEquals(1, a.getId());
		System.out.println(a.getGenres().get(0));
		//assertEquals(GenreType.Country, a.getGenres().get(1));

	}

	@Test
	public void testUser() {

		User u = em.find(User.class, 1);
		assertEquals("test", u.getFirstName());
	}
	
	@Test
	public void testBooking() {
		
		Booking b = em.find(Booking.class, 1);
		assertEquals(1, b.getArtist().getId());
		
	}

	@After
	public void tearDown() throws Exception {

		em.close();
		emf.close();
	}

}
