package model;

import java.util.List;

public class TermSet {

    private int termSetId;
    private int userId;
    private String termSetName;
    private String termSetDescription;
    private List<Term> terms;
    private boolean isPublic;

    public TermSet() {
    }

    public TermSet(int termSetId, int userId, String termSetName, String termSetDescription, List<Term> terms, boolean isPublic) {
        this.termSetId = termSetId;
        this.userId = userId;
        this.termSetName = termSetName;
        this.termSetDescription = termSetDescription;
        this.terms = terms;
        this.isPublic = isPublic;
    }

    public TermSet(int termSetId, String termSetName, String termSetDescription, boolean isPublic) {
        this.termSetId = termSetId;
        this.termSetName = termSetName;
        this.termSetDescription = termSetDescription;
        this.isPublic = isPublic;
    }        

    public int getTermSetId() {
        return termSetId;
    }

    public void setTermSetId(int termSetId) {
        this.termSetId = termSetId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTermSetName() {
        return termSetName;
    }

    public void setTermSetName(String termSetName) {
        this.termSetName = termSetName;
    }

    public String getTermSetDescription() {
        return termSetDescription;
    }

    public void setTermSetDescription(String termSetDescription) {
        this.termSetDescription = termSetDescription;
    }

    public List<Term> getTerms() {
        return terms;
    }

    public void setTerms(List<Term> terms) {
        this.terms = terms;
    }

    public boolean isIsPublic() {
        return isPublic;
    }

    public void setIsPublic(boolean isPublic) {
        this.isPublic = isPublic;
    }

    @Override
    public String toString() {
        return "TermSet{" + "termSetId=" + termSetId + ", userId=" + userId + ", termSetName=" + termSetName + ", termSetDescription=" + termSetDescription + ", terms=" + terms + ", isPublic=" + isPublic + '}';
    }

}