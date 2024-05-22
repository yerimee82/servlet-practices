package guestbook.dao;

import guestbook.vo.GuestbookVo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GuestbookDao {
    private static Connection getConnection() throws SQLException {
        Connection conn = null;
        try {
            //1. JDBC Driver 로딩
            Class.forName("org.mariadb.jdbc.Driver");

            //2. 연결하기
            String url = "jdbc:mariadb://192.168.64.3:3306/webdb?charset=utf8";
            conn = DriverManager.getConnection(url, "webdb", "webdb");
        } catch (ClassNotFoundException e) {
            System.out.println("드라이버 로딩 실패:" + e);
        }

        return conn;
    }

    public static List<GuestbookVo> findAll() {
        List<GuestbookVo> result = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement("select no, name, contents, DATE_FORMAT(reg_date, '%Y-%m-%d %H:%i') as formatted_reg_date from guestbook order by no");
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                GuestbookVo vo = new GuestbookVo();
                vo.setNo(rs.getLong(1));
                vo.setName(rs.getString(2));
                vo.setContents(rs.getString(3));
                vo.setRegDate(rs.getString(4));
                result.add(vo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean insert(GuestbookVo vo) {
        boolean result = false;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement("insert into guestbook (name, password, contents, reg_date) values (?, ?, ?, now())")) {
            pstmt.setString(1, vo.getName());
            pstmt.setString(2, vo.getPassword());
            pstmt.setString(3, vo.getContents());
            result = pstmt.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean delete(Long no, String password) {
        boolean result = false;
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement("delete from guestbook where no = ? and password = ?")) {
            pstmt.setLong(1, no);
            pstmt.setString(2, password);
            result = pstmt.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
