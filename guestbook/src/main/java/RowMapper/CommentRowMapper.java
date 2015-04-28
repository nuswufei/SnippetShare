package RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import Entity.Comment;

public class CommentRowMapper implements RowMapper<Comment>{

	@Override
	public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
		Comment comment = new Comment();
		comment.setId(rs.getInt("id"));
		comment.setSnippetID(rs.getInt("snippetID"));
		comment.setContent(rs.getString("content"));
		return comment;
	}
	
}
