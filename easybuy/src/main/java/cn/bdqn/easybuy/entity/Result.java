package cn.bdqn.easybuy.entity;

/**
 * Created by Administrator on 2017/12/18.
 */
public class Result {
    private char stuno;
    private char subjectName;
    private  int score;
    private  int age;

    @Override
    public String toString() {
        return "Result{" +
                "stuno=" + stuno +
                ", subjectName=" + subjectName +
                ", score=" + score +
                ", age=" + age +
                '}';
    }

    public char getStuno() {
        return stuno;
    }

    public void setStuno(char stuno) {
        this.stuno = stuno;
    }

    public char getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(char subjectName) {
        this.subjectName = subjectName;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
