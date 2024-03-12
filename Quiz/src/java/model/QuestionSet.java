/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author ACER
 */
public class QuestionSet {

    private int questionSetId;
    private int userId;
    private String questionSetName;
    private boolean isPublic;
    private List<Question> questions;

    public QuestionSet() {
    }

    public QuestionSet(int questionSetId, int userId, String questionSetName, boolean isPublic, List<Question> questions) {
        this.questionSetId = questionSetId;
        this.userId = userId;
        this.questionSetName = questionSetName;
        this.isPublic = isPublic;
        this.questions = questions;
    }

    public int getQuestionSetId() {
        return questionSetId;
    }

    public void setQuestionSetId(int questionSetId) {
        this.questionSetId = questionSetId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getQuestionSetName() {
        return questionSetName;
    }

    public void setQuestionSetName(String questionSetName) {
        this.questionSetName = questionSetName;
    }

    public boolean isIsPublic() {
        return isPublic;
    }

    public void setIsPublic(boolean isPublic) {
        this.isPublic = isPublic;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    @Override
    public String toString() {
        return "QuestionSet{" + "questionSetId=" + questionSetId + ", userId=" + userId + ", questionSetName=" + questionSetName + ", isPublic=" + isPublic + ", questions=" + questions + '}';
    }

}
