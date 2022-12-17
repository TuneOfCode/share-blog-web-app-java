package edu.TranThanhTu.models.dao;

import java.util.List;

import edu.TranThanhTu.models.mapper.IRowMapper;

public interface ICobanDao<E> {
    List<E> select(String sql, IRowMapper<E> rowMapper, Object... parameters);

    int insert(String sql, Object... parameters);

    int update(String sql, Object... parameters);

    int delete(String sql, Object... parameters);

    int count(String sql, Object... parameters);

    int execute(String sql, Object... parameters);
}
