package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.TermSet;

public class TermSetDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(TermSetDAO.class.getName());
    private TermDAO termDAO;

    public TermSetDAO() {
        termDAO = new TermDAO();
    }

    public List<TermSet> getTermSets() throws SQLException {
        List<TermSet> termSets = new ArrayList<>();
        String query = "SELECT TermSetID, UserID, TermSetName, TermSetDescription, IsPublic "
                + "FROM TermSets";
        try ( PreparedStatement ps = connection.prepareStatement(query);  ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                TermSet termSet = new TermSet();
                termSet.setTermSetId(rs.getInt("TermSetID"));
                termSet.setUserId(rs.getInt("UserID"));
                termSet.setTermSetName(rs.getString("TermSetName"));
                termSet.setTermSetDescription(rs.getString("TermSetDescription"));
                termSet.setIsPublic(rs.getBoolean("IsPublic"));
                termSets.add(termSet);
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error executing query", ex);
        }
        return termSets;
    }

    public TermSet getTermSetById(int id) {
        TermSet termSet = null;
        String query = "SELECT TermSetID, UserID, TermSetName, TermSetDescription, IsPublic "
                + "FROM TermSets "
                + "WHERE TermSetID = ?";
        try ( PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);
            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    termSet = new TermSet();
                    termSet.setTermSetId(rs.getInt("TermSetID"));
                    termSet.setUserId(rs.getInt("UserID"));
                    termSet.setTermSetName(rs.getString("TermSetName"));
                    termSet.setTermSetDescription(rs.getString("TermSetDescription"));
                    termSet.setIsPublic(rs.getBoolean("IsPublic"));
                    termSet.setTerms(termDAO.getTermsByTermSetId(rs.getInt("TermSetID")));
                }
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error executing query", ex);
        }
        return termSet;
    }

    public List<TermSet> getTermSetsByName(String name) {
        List<TermSet> termSets = new ArrayList<>();
        String query = "SELECT TermSetID, UserID, TermSetName, TermSetDescription, IsPublic \n"
                + "FROM TermSets \n"
                + "WHERE TermSetName LIKE ? AND IsPublic = 1";
        try ( PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, "%" + name + "%");
            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    TermSet termSet = new TermSet();
                    termSet.setTermSetId(rs.getInt("TermSetID"));
                    termSet.setUserId(rs.getInt("UserID"));
                    termSet.setTermSetName(rs.getString("TermSetName"));
                    termSet.setTermSetDescription(rs.getString("TermSetDescription"));
                    termSet.setIsPublic(rs.getBoolean("IsPublic"));
                    termSets.add(termSet);
                }
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error executing query", ex);
        }
        return termSets;
    }

    public List<TermSet> getTermSetsByUserId(int userId) {
        List<TermSet> termSets = new ArrayList<>();
        String query = "SELECT TermSetID, UserID, TermSetName, TermSetDescription, IsPublic "
                + "FROM TermSets "
                + "WHERE UserID = ?";
        try ( PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, userId);
            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    TermSet termSet = new TermSet();
                    termSet.setTermSetId(rs.getInt("TermSetID"));
                    termSet.setUserId(rs.getInt("UserID"));
                    termSet.setTermSetName(rs.getString("TermSetName"));
                    termSet.setTermSetDescription(rs.getString("TermSetDescription"));
                    termSet.setIsPublic(rs.getBoolean("IsPublic"));
                    termSets.add(termSet);
                }
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error executing query", ex);
        }
        return termSets;
    }

    public boolean updateTermSet(int id, String name, String description, boolean isPublic) {
        String query = "UPDATE termSets \n"
                + "SET TermSetName = ?, TermSetDescription = ?, IsPublic = ?\n"
                + "WHERE TermSetID = ?";
        try ( PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setBoolean(3, isPublic);
            ps.setInt(4, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error executing query", ex);
            return false;
        }
        return true;
    }

    public int addTermSet(int userId, String name, String description, boolean isPublic) {
        String query = "INSERT INTO termSets (UserID, TermSetName, TermSetDescription, IsPublic) "
                + "VALUES (?, ?, ?, ?)";
        int generatedKey = 0;
        try ( PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, userId);
            ps.setString(2, name);
            ps.setString(3, description);
            ps.setBoolean(4, isPublic);
            ps.executeUpdate();
            try ( ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    generatedKey = rs.getInt(1);
                }
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error executing query", ex);
        }
        return generatedKey;
    }

    public boolean deleteTermSet(int id) {

//        String deleteTermsQuery = "DELETE FROM Terms WHERE TermSetID = ?";
//        try ( PreparedStatement ps = connection.prepareStatement(deleteTermsQuery)) {
//            ps.setInt(1, id);
//            ps.executeUpdate();
//        } catch (SQLException ex) {
//            LOGGER.log(Level.SEVERE, "Error executing query", ex);
//            return false;
//        }
        termDAO.deleteTermsByTermSetId(id);

        String deleteTermSetQuery = "DELETE FROM TermSets WHERE TermSetID = ?";
        try ( PreparedStatement ps = connection.prepareStatement(deleteTermSetQuery)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error executing query", ex);
            return false;
        }

        return true;
    }

    public List<TermSet> getListByPage(List<TermSet> list, int start, int end) {
        ArrayList<TermSet> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

}