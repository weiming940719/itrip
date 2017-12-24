package cn.bdqn.easybuy.command.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * Created by Administrator on 2017/12/18.
 */
public class SerialNumberUtil {

    public static String getOrderIdByUUId() {
       // int machineId = 1;//最大支持1-9个集群机器部署
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMdd");
        int hashCodeV = UUID.randomUUID().toString().hashCode();
        if(hashCodeV < 0) {//有可能是负数
            hashCodeV = - hashCodeV;
        }
        // 0 代表前面补充0
        // 4 代表长度为4
        // d 代表参数为正数型
        return simpleDateFormat.format(new Date())+ String.format("%010d", hashCodeV);
    }
}
