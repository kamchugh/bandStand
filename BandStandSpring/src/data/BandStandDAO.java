package data;

import java.util.List;

import entities.Artist;

public interface BandStandDAO {
	public int getAdminLevel(int id);

	public void setUserAccessLevelToAdmin(int id);

	public void setUserAccessLevelToUser(int id);

	public List<Artist> getAllArtists();
}
