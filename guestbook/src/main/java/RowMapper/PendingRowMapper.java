package RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import Entity.Pending;

public class PendingRowMapper implements RowMapper<Pending>{

	@Override
	public Pending mapRow(ResultSet rs, int rowNum) throws SQLException {
		Pending pending = new Pending();
		pending.setBoardID(rs.getInt("boardID"));
		pending.setUsername(rs.getString("username"));
		return pending;
	}
	
}
