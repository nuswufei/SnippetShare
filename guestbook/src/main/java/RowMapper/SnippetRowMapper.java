package RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import Entity.Snippet;

public class SnippetRowMapper implements RowMapper<Snippet> {

	@Override
	public Snippet mapRow(ResultSet rs, int rowNum) throws SQLException {
		Snippet snippet = new Snippet();
		snippet.setId(rs.getInt("id"));
		snippet.setTitle(rs.getString("title"));
		snippet.setContent(rs.getString("content"));
		snippet.setOwner(rs.getString("owner"));
		snippet.setTags(rs.getString("tags"));
		snippet.setBoardID(rs.getInt("boardID"));
		return snippet;
	}

}
