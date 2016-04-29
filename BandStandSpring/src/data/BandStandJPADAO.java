package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.User;

@Transactional
public class BandStandJPADAO implements BandStandDAO {
@PersistenceContext
private EntityManager em;


User user = em.find(User.class, 1); // an example of how everything is connected


}
