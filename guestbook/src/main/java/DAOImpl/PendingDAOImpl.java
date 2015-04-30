package DAOImpl;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import DAO.PendingDAO;
import Entity.Comment;
import Entity.Pending;
import RowMapper.CommentRowMapper;
import RowMapper.PendingRowMapper;
public class PendingDAOImpl implements PendingDAO {
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public boolean insert(Pending pending) {
		String sql = "INSERT IGNORE INTO PENDING "
				+ "VALUES (?, ?)";
	int rowAffected = jdbcTemplate.update(sql, 
		new Object[]{pending.getUsername(), pending.getBoardID()});
		return rowAffected == 1;
	}

	@Override
	public boolean delete(Pending pending) {
		String sql = "DELETE FROM PENDING "
				+ "WHERE username = ? and boardID = ?";
		int rowAffected = jdbcTemplate.update(sql, 
				new Object[]{pending.getUsername(), pending.getBoardID()});
		return rowAffected == 1;
	}
	@Override
	public List<Pending> findByBoardID(int boardID) {
		String sql = "SELECT * FROM PENDING where boardID = ?"; 
		List<Pending> pendings = jdbcTemplate.query(sql, new Object[]{boardID}, new PendingRowMapper()); 
		if(pendings == null) return new ArrayList<Pending>();
		return pendings;
	}

}
