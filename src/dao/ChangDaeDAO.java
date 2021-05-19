package dao;


import model.ChangDae;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

public class ChangDaeDAO {
    private Connection conn;
    private ResultSet rs;

//    properties.load(new FileReader("../resources/application.properties"));

    public ChangDaeDAO() throws IOException {
        Properties properties = new Properties();
        properties.load(new FileReader("../resources/application.properties"));
        try {
            String dbURL = (String) properties.get("dbURL");
            String dbID = (String) properties.get("dbID");
            String dbPassword = (String) properties.get("dbPassword");
            Class.forName("org.mariadb.jdbc.Driver");
            this.conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception var4) {
            var4.printStackTrace();
        }

    }

    public ArrayList<ChangDae> search(String userID) {
        String SQL = "SELECT * FROM CHANGDAE WHERE userID LIKE ? ";
        ArrayList bbsList = new ArrayList();

        try {
            PreparedStatement pstmt = this.conn.prepareStatement(SQL);
            pstmt.setString(1, "%" + userID + "%");
            this.rs = pstmt.executeQuery();

            while (this.rs.next()) {
                ChangDae changDae = new ChangDae();
                changDae.setBbsID(this.rs.getInt(1));
                changDae.setBbsTitle(this.rs.getString(2));
                changDae.setUserID(this.rs.getString(3));
                changDae.setBbsDate(this.rs.getString(4));
                changDae.setBbsContent(this.rs.getString(5));
                changDae.setBbsAvailable(this.rs.getInt(6));
                bbsList.add(changDae);
            }
        } catch (Exception var6) {
            var6.printStackTrace();
        }

        return bbsList;
    }

    public String getDate() {
        String SQL = "SELECT NOW()";

        try {
            PreparedStatement pstmt = this.conn.prepareStatement(SQL);
            this.rs = pstmt.executeQuery();
            if (this.rs.next()) {
                return this.rs.getString(1);
            }
        } catch (Exception var3) {
            var3.printStackTrace();
        }

        return "";
    }

    public int getAvailable() {
        String SQL = "SELECT COUNT(*) from CHANGDAE where bbsAvailable = 1";

        try {
            PreparedStatement pstmt = this.conn.prepareStatement(SQL);
            this.rs = pstmt.executeQuery();
            if (this.rs.next()) {
                int temp = this.rs.getInt(1);
                return temp;
            }
        } catch (Exception var4) {
            var4.printStackTrace();
        }

        return 0;
    }

    public int getNext() {
        String SQL = "SELECT bbsID FROM CHANGDAE ORDER BY bbsID DESC";

        try {
            PreparedStatement pstmt = this.conn.prepareStatement(SQL);
            this.rs = pstmt.executeQuery();
            return this.rs.next() ? this.rs.getInt(1) + 1 : 1;
        } catch (Exception var3) {
            var3.printStackTrace();
            return -1;
        }
    }

    public int returnPages() {
        String SQL = "SELECT COUNT(*) from CHANGDAE where bbsAvailable= 1";

        try {
            PreparedStatement pstmt = this.conn.prepareStatement(SQL);
            this.rs = pstmt.executeQuery();
            if (this.rs.next()) {
                int temp = this.rs.getInt(1);
                temp = temp / 10 + 1;
                return temp;
            }
        } catch (Exception var4) {
            var4.printStackTrace();
        }

        return 0;
    }

    public int write(String bbsTitle, String userID, String bbsContent) {
        String SQL = "INSERT INTO CHANGDAE VALUE(?,?,?,?,?,?)";

        try {
            PreparedStatement pstmt = this.conn.prepareStatement(SQL);
            pstmt.setInt(1, this.getNext());
            pstmt.setString(2, bbsTitle);
            pstmt.setString(3, userID);
            pstmt.setString(4, this.getDate());
            pstmt.setString(5, bbsContent);
            pstmt.setInt(6, 1);
            return pstmt.executeUpdate();
        } catch (Exception var6) {
            var6.printStackTrace();
            return -1;
        }
    }

    public int getUnAvailable(int pageNumber) {
        String SQL = "SELECT COUNT(*) from CHANGDAE where bbsID > ? AND bbsAvailable = 0";

        try {
            PreparedStatement pstmt = this.conn.prepareStatement(SQL);
            int t = this.getNext() - (pageNumber - 1) * 10 - 1;
            pstmt.setInt(1, t);
            this.rs = pstmt.executeQuery();
            if (this.rs.next()) {
                int temp = this.rs.getInt(1);
                return temp;
            }
        } catch (Exception var6) {
            var6.printStackTrace();
        }

        return 0;
    }

    public int getBetweenUnAvailable(int a, int b) {
        String SQL = "SELECT COUNT(*) from CHANGDAE where bbsID >= ? AND bbsID <= ? AND bbsAvailable = 0";

        try {
            PreparedStatement pstmt = this.conn.prepareStatement(SQL);
            pstmt.setInt(1, a);
            pstmt.setInt(2, b);
            this.rs = pstmt.executeQuery();
            if (this.rs.next()) {
                int temp = this.rs.getInt(1);
                return temp;
            }
        } catch (Exception var6) {
            var6.printStackTrace();
        }

        return 0;
    }

    public ArrayList<ChangDae> getList(int pageNumber) {
        String SQL = "SELECT * from CHANGDAE where bbsID < ? AND bbsAvailable= 1 ORDER by bbsID DESC LIMIT 10";
        ArrayList list = new ArrayList();

        try {
            PreparedStatement pstmt = this.conn.prepareStatement(SQL);
            int unAvail = this.getUnAvailable(pageNumber);
            int temp = this.getNext() - (pageNumber - 1) * 10 - unAvail;
            int temp2 = this.getNext() - (pageNumber - 1) * 10 - 1;
            int BonusUnAvailable = this.getBetweenUnAvailable(temp, temp2);
            pstmt.setInt(1, this.getNext() - (pageNumber - 1) * 10 - unAvail - BonusUnAvailable);
            this.rs = pstmt.executeQuery();

            while (this.rs.next()) {
                ChangDae changDae = new ChangDae();
                changDae.setBbsID(this.rs.getInt(1));
                changDae.setBbsTitle(this.rs.getString(2));
                changDae.setUserID(this.rs.getString(3));
                changDae.setBbsDate(this.rs.getString(4));
                changDae.setBbsContent(this.rs.getString(5));
                changDae.setBbsAvailable(this.rs.getInt(6));
                list.add(changDae);
            }
        } catch (Exception var10) {
            var10.printStackTrace();
        }

        return list;
    }

    public ArrayList<ChangDae> getViewAllList(String year, String month, String day, String year2, String month2, String day2) {
        String temp = year + "-" + month + "-" + day;
        String temp2 = year2 + "-" + month2 + "-" + day2;
        String SQL = "SELECT * from CHANGDAE WHERE DATE(bbsDate) BETWEEN ? AND ? AND bbsAvailable= 1";
        ArrayList list = new ArrayList();

        try {
            PreparedStatement pstmt = this.conn.prepareStatement(SQL);
            pstmt.setString(1, temp);
            pstmt.setString(2, temp2);
            this.rs = pstmt.executeQuery();

            while (this.rs.next()) {
                ChangDae changDae = new ChangDae();
                changDae.setBbsID(this.rs.getInt(1));
                changDae.setBbsTitle(this.rs.getString(2));
                changDae.setUserID(this.rs.getString(3));
                changDae.setBbsDate(this.rs.getString(4));
                changDae.setBbsContent(this.rs.getString(5));
                changDae.setBbsAvailable(this.rs.getInt(6));
                list.add(changDae);
            }
        } catch (Exception var13) {
            var13.printStackTrace();
        }

        return list;
    }

    public boolean nextPage(int pageNumber) {
        String SQL = "SELECT * from CHANGDAE where bbsID < ? AND bbsAvailable= 1 ORDER by bbsID DESC LIMIT 10";

        try {
            PreparedStatement pstmt = this.conn.prepareStatement(SQL);
            pstmt.setInt(1, this.getNext() - (pageNumber - 1) * 10);
            this.rs = pstmt.executeQuery();
            if (this.rs.next()) {
                return true;
            }
        } catch (Exception var4) {
            var4.printStackTrace();
        }

        return false;
    }

    public ChangDae getChangDae(int bbsID) {
        String SQL = "SELECT * FROM CHANGDAE WHERE bbsID = ?";

        try {
            PreparedStatement pstmt = this.conn.prepareStatement(SQL);
            pstmt.setInt(1, bbsID);
            this.rs = pstmt.executeQuery();
            if (this.rs.next()) {
                ChangDae changDae = new ChangDae();
                changDae.setBbsID(this.rs.getInt(1));
                changDae.setBbsTitle(this.rs.getString(2));
                changDae.setUserID(this.rs.getString(3));
                changDae.setBbsDate(this.rs.getString(4));
                changDae.setBbsContent(this.rs.getString(5));
                changDae.setBbsAvailable(this.rs.getInt(6));
                return changDae;
            }
        } catch (Exception var5) {
            var5.printStackTrace();
        }

        return null;
    }

    public int update(int bbsID, String bbsTitle, String bbsContent) {
        String SQL = "UPDATE CHANGDAE SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";

        try {
            PreparedStatement pstmt = this.conn.prepareStatement(SQL);
            pstmt.setString(1, bbsTitle);
            pstmt.setString(2, bbsContent);
            pstmt.setInt(3, bbsID);
            return pstmt.executeUpdate();
        } catch (Exception var6) {
            var6.printStackTrace();
            return -1;
        }
    }

    public int delete(int bbsID) {
        String SQL = "UPDATE CHANGDAE SET bbsAvailable=0 WHERE bbsID = ?";

        try {
            PreparedStatement pstmt = this.conn.prepareStatement(SQL);
            pstmt.setInt(1, bbsID);
            return pstmt.executeUpdate();
        } catch (Exception var4) {
            var4.printStackTrace();
            return -1;
        }
    }
}
