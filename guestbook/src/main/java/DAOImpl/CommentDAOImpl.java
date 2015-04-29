package DAOImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import DAO.CommentDAO;
import Entity.Comment;
import RowMapper.CommentRowMapper;

public class CommentDAOImpl implements CommentDAO{
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public boolean insert(Comment comment) {
		String sql = "INSERT IGNORE INTO COMMENT "
				+ "(content, snippetID)"
				+ "VALUES (?, ?)";
	int rowAffected = jdbcTemplate.update(sql, 
		new Object[]{comment.getContent(), comment.getSnippetID()});
		return rowAffected == 1;
	}

	@Override
	public List<Comment> findBySnippetID(int id) {
		String sql = "SELECT * FROM COMMENT where snippetID = ?"; 
		List<Comment> comments = jdbcTemplate.query(sql, new Object[]{id}, new CommentRowMapper()); 
		if(comments == null) return new ArrayList<Comment>();
		return comments;
	}

}
