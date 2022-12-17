package edu.TranThanhTu.models.dao.implement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import edu.TranThanhTu.models.dao.ICobanDao;
import edu.TranThanhTu.models.mapper.IRowMapper;

public class CobanDao<E> implements ICobanDao<E> {
    ResourceBundle resourceBundle = ResourceBundle.getBundle("db");

    public Connection getConnection() {
	try {
	    Class.forName(resourceBundle.getString("driverName"));
//	    System.out.println("xong buoc 1");
	    String url = resourceBundle.getString("url");
	    String user = resourceBundle.getString("username");
	    String password = resourceBundle.getString("password");
//	    System.out.println("xong buoc 2");
	    return DriverManager.getConnection(url, user, password);
	} catch (ClassNotFoundException | SQLException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
	return null;
    }

    void setParameter(PreparedStatement cmd, Object parameters[]) {
	try {
	    for (int i = 0; i < parameters.length; i++) {
		Object parameter = parameters[i];
		int index = i + 1;
		if (parameter instanceof Integer) {
		    cmd.setInt(index, (Integer) parameter);
		} else if (parameter instanceof String) {
		    cmd.setString(index, (String) parameter);
		} else if (parameter instanceof Date) {
		    cmd.setDate(index, (Date) parameter);
		} else {
		    cmd.setNull(index, Types.NULL);
		}
	    }
	} catch (SQLException e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
    }

    @Override
    public List<E> select(String sql, IRowMapper<E> rowMapper, Object... parameters) {
	// TODO Auto-generated method stub
	List<E> datas = new ArrayList<E>();
	Connection conn = null;
	PreparedStatement cmd = null;
	ResultSet rs = null;
	try {
	    conn = getConnection();
	    cmd = conn.prepareStatement(sql);
	    setParameter(cmd, parameters);
	    rs = cmd.executeQuery();
	    while (rs.next()) {
		datas.add(rowMapper.mapRow(rs));
	    }
	    return datas;
	} catch (SQLException e) {
	    // TODO: handle exception
	    e.printStackTrace();
	    return null;
	} finally {
	    try {
		if (conn != null) {
		    conn.close();
		}
		if (cmd != null) {
		    cmd.close();
		}
		if (rs != null) {
		    rs.close();
		}
	    } catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
		return null;
	    }
	}
    }

    @Override
    public int insert(String sql, Object... parameters) {
	// TODO Auto-generated method stub
	Connection conn = null;
	PreparedStatement cmd = null;
	ResultSet rs = null;
	try {
	    int result = 0;
	    conn = getConnection();
	    conn.setAutoCommit(false);
	    cmd = conn.prepareStatement(sql);
	    setParameter(cmd, parameters);
	    rs = cmd.executeQuery();
	    if (rs.next()) {
		result = rs.getInt(1);
	    }
	    conn.commit();
	    return result;
	} catch (SQLException e) {
	    // TODO: handle exception
	    if (conn != null) {
		try {
		    conn.rollback();
		} catch (SQLException e1) {
		    // TODO Auto-generated catch block
		    e1.printStackTrace();
		}
	    }
	} finally {
	    try {
		if (conn != null) {
		    conn.close();
		}
		if (cmd != null) {
		    cmd.close();
		}
		if (rs != null) {
		    rs.close();
		}
	    } catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
	    }
	}
	return 0;
    }

    @Override
    public int update(String sql, Object... parameters) {
	// TODO Auto-generated method stub
	Connection conn = null;
	PreparedStatement cmd = null;
	ResultSet rs = null;
	try {
	    int result = 0;
	    conn = getConnection();
	    conn.setAutoCommit(false);
	    cmd = conn.prepareStatement(sql);
	    setParameter(cmd, parameters);
	    rs = cmd.executeQuery();

	    if (rs.next()) {
		result = rs.getInt(1);
	    }
	    conn.commit();
	    return result;
	} catch (SQLException e) {
	    // TODO: handle exception
	    if (conn != null) {
		try {
		    conn.rollback();
		} catch (SQLException e1) {
		    // TODO Auto-generated catch block
		    e1.printStackTrace();
		}
	    }
	} finally {
	    try {
		if (conn != null) {
		    conn.close();
		}
		if (cmd != null) {
		    cmd.close();
		}
		if (rs != null) {
		    rs.close();
		}
	    } catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
	    }
	}
	return 0;
    }

    @Override
    public int delete(String sql, Object... parameters) {
	// TODO Auto-generated method stub
	Connection conn = null;
	PreparedStatement cmd = null;
	ResultSet rs = null;
	try {
	    int result = 0;
	    conn = getConnection();
	    conn.setAutoCommit(false);
	    cmd = conn.prepareStatement(sql);
	    setParameter(cmd, parameters);
	    rs = cmd.executeQuery();

	    if (rs.next()) {
		result = rs.getInt(1);
	    }
	    conn.commit();
	    return result;
	} catch (SQLException e) {
	    // TODO: handle exception
	    if (conn != null) {
		try {
		    conn.rollback();
		} catch (SQLException e1) {
		    // TODO Auto-generated catch block
		    e1.printStackTrace();
		}
	    }
	} finally {
	    try {
		if (conn != null) {
		    conn.close();
		}
		if (cmd != null) {
		    cmd.close();
		}
		if (rs != null) {
		    rs.close();
		}
	    } catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
	    }
	}
	return 0;
    }

    @Override
    public int count(String sql, Object... parameters) {
	// TODO Auto-generated method stub
	Connection conn = null;
	PreparedStatement cmd = null;
	ResultSet rs = null;
	try {
	    int count = 0;
	    conn = getConnection();
	    conn.setAutoCommit(false);
	    cmd = conn.prepareStatement(sql);
	    setParameter(cmd, parameters);
	    rs = cmd.executeQuery();
	    if (rs.next()) {
		count = rs.getInt(1);
	    }
	    conn.commit();
	    return count;
	} catch (SQLException e) {
	    // TODO: handle exception
	    if (conn != null) {
		try {
		    conn.rollback();
		} catch (SQLException e1) {
		    // TODO Auto-generated catch block
		    e1.printStackTrace();
		}
	    }
	} finally {
	    try {
		if (conn != null) {
		    conn.close();
		}
		if (cmd != null) {
		    cmd.close();
		}
		if (rs != null) {
		    rs.close();
		}
	    } catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
	    }
	}
	return 0;
    }

    @Override
    public int execute(String sql, Object... parameters) {
	// TODO Auto-generated method stub
	// TODO Auto-generated method stub
	Connection conn = null;
	PreparedStatement cmd = null;
	ResultSet rs = null;
	try {
	    conn = getConnection();
	    conn.setAutoCommit(false);
	    cmd = conn.prepareStatement(sql);
	    setParameter(cmd, parameters);
	    cmd.executeUpdate();
	    conn.commit();
	    return 1;
	} catch (SQLException e) {
	    // TODO: handle exception
	    if (conn != null) {
		try {
		    conn.rollback();
		} catch (SQLException e1) {
		    // TODO Auto-generated catch block
		    e1.printStackTrace();
		}
	    }
	} finally {
	    try {
		if (conn != null) {
		    conn.close();
		}
		if (cmd != null) {
		    cmd.close();
		}
		if (rs != null) {
		    rs.close();
		}
	    } catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
	    }
	}
	return 0;
    }

}
