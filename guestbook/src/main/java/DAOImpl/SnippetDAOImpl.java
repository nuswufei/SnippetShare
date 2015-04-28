package DAOImpl;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import DAO.SnippetDAO;
import Entity.Snippet;

public class SnippetDAOImpl implements SnippetDAO {
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public boolean insert(Snippet snippet) {
		String sql = "INSERT IGNORE INTO SNIPPET "
				+ "(title, tags, content, boardID, owner)"
				+ "VALUES (?, ?, ?, ?, ?)";
	int rowAffected = jdbcTemplate.update(sql, 
		new Object[]{snippet.getTitle(), snippet.getTags(), snippet.getContent(),
			snippet.getBoardID(), snippet.getOwner()});
		return rowAffected == 1;
	}
	@Override
	public List<Snippet> findByBoard(int boardID) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean deleteByID(int id) {
		String sql = "DELETE FROM SNIPPET "
				+ "WHERE id = ?";
		int rowAffected = jdbcTemplate.update(sql, 
				new Object[]{id});
		return rowAffected == 1;
	}
	@Override
	public boolean update(int id, Snippet snippet) {
		// TODO Auto-generated method stub
		return false;
	}
	
	

}
