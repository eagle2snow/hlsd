package com.fh.entity.hlsd;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class TExamineSubject implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -2667732939362538814L;

	private String questionId; //问题id

    private String questionType; //问题类型

    private String questionName; //问题描述

    private String rightAnswers; //正确答案

    private Integer joinExam; //加入考试

    private Date createtime; //创建时间

    private String createuser; //创建者

    private Date updatetime; //修改时间

    private String updateuser; //修改者
    
    private Set<TExamineSubjectOption> TExamineSubjectOptions = new HashSet<TExamineSubjectOption>(); //问题对应的多个选择

    public String getQuestionId() {
        return questionId;
    }

    public void setQuestionId(String questionId) {
        this.questionId = questionId == null ? null : questionId.trim();
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType == null ? null : questionType.trim();
    }

    public String getQuestionName() {
        return questionName;
    }

    public void setQuestionName(String questionName) {
        this.questionName = questionName == null ? null : questionName.trim();
    }

    public String getRightAnswers() {
        return rightAnswers;
    }

    public void setRightAnswers(String rightAnswers) {
        this.rightAnswers = rightAnswers == null ? null : rightAnswers.trim();
    }

    public Integer getJoinExam() {
        return joinExam;
    }

    public void setJoinExam(Integer joinExam) {
        this.joinExam = joinExam;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getCreateuser() {
        return createuser;
    }

    public void setCreateuser(String createuser) {
        this.createuser = createuser == null ? null : createuser.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getUpdateuser() {
        return updateuser;
    }

    public void setUpdateuser(String updateuser) {
        this.updateuser = updateuser == null ? null : updateuser.trim();
    }

	public Set<TExamineSubjectOption> getTExamineSubjectOptions() {
		return TExamineSubjectOptions;
	}

	public void setTExamineSubjectOptions(Set<TExamineSubjectOption> tExamineSubjectOptions) {
		TExamineSubjectOptions = tExamineSubjectOptions;
	}
    
    
}