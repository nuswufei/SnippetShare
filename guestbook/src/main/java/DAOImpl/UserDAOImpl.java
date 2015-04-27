package DAOImpl;

import org.springframework.jdbc.core.JdbcTemplate;

import DAO.UserDAO;
import Entity.User;

public class UserDAOImpl implements UserDAO {
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public boolean insert(User user) {
		String sql = "INSERT IGNORE INTO USER "
				+ "VALUES (?, ?, ?, ?, ?)";
	int rowAffected = jdbcTemplate.update(sql, 
		new Object[]{user.getUsername(), user.getPassword(),user.getAuthorities(),
			user.getName(), user.getAddress()});
		return rowAffected == 1;
	}

}
