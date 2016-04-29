package test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class TestJunit {
	
	
	private EntityManagerFactory emf;
	private EntityManager em;

	@Before
	public void setUp() throws Exception {
	
		emf = Persistence.createEntityManagerFactory("awesomebandsdb");
		em = emf.createEntityManager();

	
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		em.close();
		emf.close();
	}

}
