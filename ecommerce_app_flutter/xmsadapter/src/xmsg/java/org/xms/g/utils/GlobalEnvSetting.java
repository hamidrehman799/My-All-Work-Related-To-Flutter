package org.xms.g.utils;

import java.util.Arrays;

import android.content.Context;

/**
 * Class for Global Environment Settings
 */
public class GlobalEnvSetting {
    /**
     * org.xms.g.utils.GlobalEnvSetting.init(Context ctx, XmsLog.XmsLogInterface logImpl) init Xms Adapter<br/>
     *
     * @param ctx     Context
     * @param logImpl If you want to print the log to your own log file system, please implement {@link XmsLog.XmsLogInterface}.If you put Null logImpl, then you will use default Android Logcat to print XmsAdapter's log.
     */
    public static void init(Context ctx, XmsLog.XmsLogInterface logImpl) {
        XmsLog.newInstance(logImpl);
    }

    /**
     * org.xms.g.utils.GlobalEnvSetting.isHms() judge if the environment is hms or not.<br/>
     *
     * @return true if the environment is hms, otherwise false
     */
    public static boolean isHms() {
        return false;
    }

    /**
     * Do not call this method
     */
    @Deprecated
    public static void useGms() {
    }

    /**
     * Do not call this method
     */
    @Deprecated
    public static void useHms() {
        throw new RuntimeException("Not supported");
    }
}
