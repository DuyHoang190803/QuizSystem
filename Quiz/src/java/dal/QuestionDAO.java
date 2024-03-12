/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Option;
import model.Question;
import model.QuestionSet;

/**
 *
 * @author ACER
 */
public class QuestionDAO extends DBContext {

    public List<Option> getOptionByQuestionId(int questionId) {
        List<Option> list = new ArrayList<>();
        String sql = "select * from Options where QuestionID=?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Option o = new Option();
                o.setOptionId(rs.getInt("OptionID"));
                o.setQuestionId(questionId);
                o.setOption(rs.getString("Option"));
                o.setIsCorrect(rs.getBoolean("IsCorrect"));

                list.add(o);
            }
            return list;

        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Question getQuestionByQuestionId(int questionId) {

        String sql = "select * from Questions where QuestionID=?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestionID(rs.getInt("QuestionID"));
                q.setQuestionSetID(rs.getInt("QuestionSetID"));
                q.setQuestion(rs.getString("Question"));
                List<Option> options = getOptionByQuestionId(questionId);
                q.setOptions(options);
                return q;
            }

        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<QuestionSet> getQuestionSetByUserId(int uid) {
        List<QuestionSet> list = new ArrayList<>();
        String sql = "select * from QuestionSets where UserID=?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                QuestionSet qs = new QuestionSet();
                qs.setQuestionSetId(rs.getInt("QuestionSetID"));
                qs.setUserId(uid);
                qs.setQuestionSetName(rs.getString("QuestionSetName"));
                qs.setIsPublic(rs.getBoolean("IsPublic"));

                list.add(qs);
            }
            return list;

        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Question> getQuestionByQsid(int questionSetId) {
        List<Question> list = new ArrayList<>();
        String sql = "select * from Questions where QuestionSetID=?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionSetId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestionID(rs.getInt("QuestionID"));
                q.setQuestionSetID(questionSetId);
                q.setQuestion(rs.getString("Question"));
                List<Option> options = getOptionByQuestionId(rs.getInt("QuestionID"));
                q.setOptions(options);

                list.add(q);
            }
            return list;

        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public QuestionSet getAllQnAByQuestionSetId(int questionSetId) {
        String sql = "select * from QuestionSets where QuestionSetID=?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionSetId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                QuestionSet qs = new QuestionSet();
                qs.setQuestionSetId(rs.getInt("QuestionSetID"));
                qs.setIsPublic(rs.getBoolean("IsPublic"));
                qs.setQuestionSetName(rs.getString("QuestionSetName"));
                qs.setUserId(rs.getInt("UserID"));

                return qs;
            }

        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Question getQuestionByQuestionName(String question) {

        String sql = "select * from Questions where Question=?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, question);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestionID(rs.getInt("QuestionID"));
                q.setQuestionSetID(rs.getInt("QuestionSetID"));
                q.setQuestion(rs.getString("Question"));
                List<Option> options = getOptionByQuestionId(rs.getInt("QuestionID"));
                q.setOptions(options);

                return q;
            }

        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Question getQuestionByQuestionNameAndSet(String question, int qsid) {

        String sql = "select * from Questions where Question=? AND QuestionSetID=?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, question);
            stm.setInt(2, qsid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestionID(rs.getInt("QuestionID"));
                q.setQuestionSetID(rs.getInt("QuestionSetID"));
                q.setQuestion(rs.getString("Question"));
//                List<Option> options = getOptionByQuestionId(rs.getInt("QuestionID"));
//                q.setOptions(options);

                return q;
            }

        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void createQuestionSet(QuestionSet qs) {
        String sql = "insert into QuestionSets (UserID, QuestionSetName,isPublic)\n"
                + "values (?,?,?)";
        try {

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, qs.getUserId());
            stm.setString(2, qs.getQuestionSetName());
            stm.setBoolean(3, qs.isIsPublic());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void createQuestion(String question, int id) {
        String sql = "insert into Questions (Question,QuestionSetID)\n"
                + "values (?,?)";
        try {

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, question);
            stm.setInt(2, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void insertOption(int questionId, String option1, String option2, String option3, String option4) {
        String sql = "insert into Options (QuestionID, [Option], IsCorrect)\n"
                + "values (?,?,0),(?,?,0),(?,?,0),(?,?,0)";
        try {

            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, questionId);
            stm.setString(2, option1);
            stm.setInt(3, questionId);
            stm.setString(4, option2);
            stm.setInt(5, questionId);
            stm.setString(6, option3);
            stm.setInt(7, questionId);
            stm.setString(8, option4);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void setIsCorrect(String option, int questionId) {
        String sql = "UPDATE Options\n"
                + "SET IsCorrect = 1\n"
                + "WHERE [Option] = ? and QuestionID=?;";
        try {

            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, option);
            stm.setInt(2, questionId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void deleteQuestion(int questionID) {
        String sql = "delete from Options\n"
                + "where QuestionID= ?;\n"
                + "\n"
                + "delete from Questions\n"
                + "where QuestionID= ?;";

        try {

            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, questionID);
            stm.setInt(2, questionID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteQuestionSet(int qsid) {
        String sql = "DELETE FROM Options WHERE QuestionID IN \n"
                + "(SELECT QuestionID FROM Questions WHERE QuestionSetID = ?);\n"
                + "\n"
                + "DELETE FROM Questions WHERE QuestionSetID = ?;\n"
                + "\n"
                + "DELETE FROM QuestionSets WHERE QuestionSetID = ?;";

        try {

            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, qsid);
            stm.setInt(2, qsid);
            stm.setInt(3, qsid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editQuestion(int questionID, String question, String[] options, String[] isCorrects) {
        String sql = "update Questions\n"
                + "set question= ?\n"
                + "where QuestionID=?;";
        String sql1 = "select optionID\n"
                + "from Options \n"
                + "where questionID= ?";
        String sql2 = "UPDATE Options \n"
                + "SET  [Option]=? , isCorrect = ? \n"
                + "WHERE optionId = ?";
        try (
                 PreparedStatement stm = connection.prepareStatement(sql);  PreparedStatement stm1 = connection.prepareStatement(sql1);  PreparedStatement stm2 = connection.prepareStatement(sql2);) {

            // update question
            stm.setString(1, question);
            stm.setInt(2, questionID);
            stm.executeUpdate();

            //get optionId
            stm1.setInt(1, questionID);
            ResultSet rs = stm1.executeQuery();
            int i = 0;
            while (rs.next()) {
                int optionId = rs.getInt("optionID");
                //Set new option
                stm2.setString(1, options[i]);
                String op = "option" + (i + 1);
                stm2.setBoolean(2, contains(isCorrects, op));
                stm2.setInt(3, optionId);
                stm2.executeUpdate();
                i++;
            }

        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean contains(String[] array, String target) {
        for (String item : array) {
            if (item.equals(target)) {
                return true;
            }
        }
        return false;
    }

    public static void main(String[] args) {

        //1. Tạo câu hỏi
        //2. Tạo option
        //3. Set câu trả lời đúng
        QuestionDAO dao = new QuestionDAO();
        Question q = dao.getQuestionByQuestionId(36);
        System.out.println(q.toString());
        String question = "7 gà";
        String[] options = {"Cùi bảy nướng", "elodia", "icaris", "APOLLO"};
        String[] isCorrects = {"option3", "option1", "option4"};
        dao.editQuestion(36, question, options, isCorrects);
        System.out.println("--> New question " + 36);
        System.out.println(dao.getQuestionByQuestionId(36));

    }

}
