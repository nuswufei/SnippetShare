package DAOImpl;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import DAO.BoardDAO;
import Entity.Board;
import RowMapper.BoardRowMapper;

public class BoardDAOImpl implements BoardDAO {
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public boolean insert(Board board) {
		String sql = "INSERT IGNORE INTO BOARD "
				+ "(title, category, access, username)"
				+ "VALUES (?, ?, ?, ?)";
	int rowAffected = jdbcTemplate.update(sql, 
		new Object[]{board.getTitle(), board.getCategory(), board.getAccess(), board.getUsername()});
		return rowAffected == 1;
	}
	@Override
	public List<Board> findOwnBoard(String username) {
		String sql = "SELECT * FROM BOARD where username = ?"; 
		List<Board> boards = jdbcTemplate.query(sql, new Object[]{username}, new BoardRowMapper()); 
		return boards;
	}

}
