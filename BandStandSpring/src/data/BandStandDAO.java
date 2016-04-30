package data;

import java.util.List;

import entities.Artist;

public interface BandStandDAO {
	public int getAdminLevel(int id);

	public void setUserAccessLevelToAdmin(int id);

	public void setUserAccessLevelToUser(int id);

	public List<Artist> getAllArtists();

	public Artist getArtistById(int artistID);

	public void addArtist(String name, String email, String password);

	public void deleteArtistById(int artistId);

	public void addUser(String firstName, String lastName, String email, String password);
	
	public void deleteUserById(int userId);
}
