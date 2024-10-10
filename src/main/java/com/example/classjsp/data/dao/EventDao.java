package com.example.classjsp.data.dao;

import com.example.classjsp.DBconnect;
import com.example.classjsp.data.dto.EventDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EventDao {
    DBconnect db = new DBconnect();


    public void insertEvent(EventDto event) {
        Connection conn = db.getConnection();
        String sql = "insert into events(title, start_date, end_date, information, user_id) values(?,?,?,?,?)";
        PreparedStatement ps = null;

        try {
            ps = conn.prepareStatement(sql);

            ps.setString(1, event.getTitle());
            ps.setTimestamp(2,event.getStartDate());
            ps.setTimestamp(3,event.getEndDate());
            ps.setString(4, event.getInformation());
            ps.setString(5, event.getUserId());

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            db.dbClose(ps, conn);
        }
    }


    public List<EventDto> getEvents() {
        Connection conn = db.getConnection();
        String sql = "select * from events order by start_date desc";
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<EventDto> events = new ArrayList<>();

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                EventDto eventDto = new EventDto();

                eventDto.setId(rs.getInt("id"));
                eventDto.setTitle(rs.getString("title"));
                eventDto.setStartDate(rs.getTimestamp("start_date"));
                eventDto.setEndDate(rs.getTimestamp("end_date"));
                eventDto.setInformation(rs.getString("information"));
                eventDto.setUserId(rs.getString("user_id"));

                events.add(eventDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            db.dbClose(rs, ps, conn);
        }

        return events;
    }

    public List<EventDto> getEventsByYearMonth(String yearMonth) {
        Connection conn = db.getConnection();
        String sql = "SELECT * FROM events WHERE DATE_FORMAT(start_date, '%Y-%m') = ? order by start_date";
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<EventDto> events = new ArrayList<>();

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, yearMonth);
            rs = ps.executeQuery();
            while (rs.next()) {
                EventDto eventDto = new EventDto();
                eventDto.setId(rs.getInt("id"));
                eventDto.setTitle(rs.getString("title"));
                eventDto.setStartDate(rs.getTimestamp("start_date"));
                eventDto.setEndDate(rs.getTimestamp("end_date"));
                eventDto.setInformation(rs.getString("information"));
                eventDto.setUserId(rs.getString("user_id"));
                events.add(eventDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            db.dbClose(rs, ps, conn);
        }

        return events;
    }

    public void updateEvent(EventDto event) {
        Connection conn = db.getConnection();
        String sql = "UPDATE events SET title = ?, start_date = ?, end_date = ?, information = ?, user_id = ? WHERE id = ?";
        PreparedStatement ps = null;

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, event.getTitle());
            ps.setTimestamp(2, event.getStartDate());
            ps.setTimestamp(3, event.getEndDate());
            ps.setString(4, event.getInformation());
            ps.setString(5, event.getUserId());
            ps.setInt(6, event.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            db.dbClose(ps, conn);
        }
    }

    public void deleteEventById(int id) {
        Connection conn = db.getConnection();
        String sql = "DELETE FROM events WHERE id = ?";
        PreparedStatement ps = null;

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            db.dbClose(ps, conn);
        }
    }
}
