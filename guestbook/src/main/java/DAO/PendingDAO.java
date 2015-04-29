package DAO;
import Entity.Pending;
public interface PendingDAO {
	public boolean insert(Pending pending);
	public boolean delete(Pending pending);
}
