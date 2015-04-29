package DAOImpl;
import org.springframework.jdbc.core.JdbcTemplate;

import DAO.AccessDAO;
import Entity.Access;
public class AccessDAOImpl implements AccessDAO {
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public boolean insert(Access access) {
		String sql = "INSERT IGNORE INTO ACCESS "
				+ "VALUES (?, ?)";
	int rowAffected = jdbcTemplate.update(sql, 
		new Object[]{access.getUsername(), access.getBoardID()});
		return rowAffected == 1;
	}

}
