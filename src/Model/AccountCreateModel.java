package Model;

import Database.DatabaseConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AccountCreateModel {
    
    public static boolean createAccount(String username, String password, String acctype) {
        String query = "INSERT INTO accounts (username, password, acctype) VALUES (?, ?, ?)";
        try (Connection con = DatabaseConnector.connect(); 
            PreparedStatement pst = con.prepareStatement(query)) {
            
            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, acctype);
            
            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException ex) {
            throw new RuntimeException("Database Error: " + ex.getMessage(), ex);
        }
    }
}
