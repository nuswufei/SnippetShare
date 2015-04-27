package RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import Entity.Board;

public class BoardRowMapper implements RowMapper<Board> {

	@Override
	public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
		Board board = new Board();
		board.setId(rs.getInt("id"));
		board.setAccess(rs.getString("access"));
		board.setCategory(rs.getString("category"));
		board.setTitle(rs.getString("title"));
		board.setUsername(rs.getString("username"));
		return board;
	}

}
