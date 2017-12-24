package cn.bdqn.easybuy.command.util;

public class Message {
    private String code;
    private String msg;

    public static  Message success() {
        Message message=new Message();
        message.setCode("0000");
        message.setMsg("操作成功");
        return message;
    }

    public static  Message error1() {
        Message message=new Message();
        message.setCode("0000");
        message.setMsg("上传失败");
        return message;
    }

    public static  Message error2() {
        Message message=new Message();
        message.setCode("0000");
        message.setMsg("上传图片格式不正确");
        return message;
    }

    public static  Message error3() {
        Message message=new Message();
        message.setCode("0000");
        message.setMsg("图片大小不正确");
        return message;
    }

    public static Message error() {
        Message message=new Message();
        message.setCode("0001");
        message.setMsg("操作失败");
        return message;
    }

    public static Message failed(){
        Message message=new Message();
        message.setCode("0001");
        message.setMsg("有子类存在，无法删除，请先删除子类");
        return  message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
