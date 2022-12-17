package edu.TranThanhTu.models.mapper;

import java.sql.ResultSet;

public interface IRowMapper<E> {
    E mapRow(ResultSet rs);
}
