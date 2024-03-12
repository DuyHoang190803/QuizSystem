/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class Option {
    private int optionId;
    private int questionId;
    private String option;
    private boolean isCorrect;

    public Option() {
    }

    public Option(int optionId, int questionId, String option, boolean isCorrect) {
        this.optionId = optionId;
        this.questionId = questionId;
        this.option = option;
        this.isCorrect = isCorrect;
    }

    public int getOptionId() {
        return optionId;
    }

    public void setOptionId(int optionId) {
        this.optionId = optionId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public boolean isIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(boolean isCorrect) {
        this.isCorrect = isCorrect;
    }

    @Override
    public String toString() {
        return "Option{" + "optionId=" + optionId + ", questionId=" + questionId + ", option=" + option + ", isCorrect=" + isCorrect + '}';
    }
    
}
