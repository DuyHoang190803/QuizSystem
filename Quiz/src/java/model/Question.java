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
public class Question {
    private int questionID;
    private int questionSetID;
    private String question;
    private List<Option> options;

    public Question() {
    }

    public Question(int questionID, int questionSetID, String question, List<Option> options) {
        this.questionID = questionID;
        this.questionSetID = questionSetID;
        this.question = question;
        this.options = options;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public int getQuestionSetID() {
        return questionSetID;
    }

    public void setQuestionSetID(int questionSetID) {
        this.questionSetID = questionSetID;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<Option> getOptions() {
        return options;
    }

    public void setOptions(List<Option> options) {
        this.options = options;
    }

    @Override
    public String toString() {
        return "Question{" + "questionID=" + questionID + ", questionSetID=" + questionSetID + ", question=" + question + ", options=" + options + '}';
    }
    
}
