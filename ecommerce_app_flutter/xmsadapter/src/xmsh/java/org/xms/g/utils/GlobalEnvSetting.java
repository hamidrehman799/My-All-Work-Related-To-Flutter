package org.xms.g.utils;

import java.util.Arrays;

import android.content.Context;

public class GlobalEnvSetting {
    /**
     *  init Xms Adapter
     * @param ctx
     * @param logImpl If you want to print the log to your own log file system, please implement {@link XmsLog.XmsLogInterface}.
     *                If you put Null logImpl, then you will use default Android Logcat to print XmsAdapter's log.
     */
    public static void init(Context ctx, XmsLog.XmsLogInterface logImpl) {
        XmsLog.newInstance(logImpl);
    }

    public static boolean isHms() {
        return true;
    }

    /**
     * Do not call this method
     */
    @Deprecated
    public static void useGms() {
        throw new RuntimeException("Not supported");
    }

    /**
     * Do not call this method
     */
    @Deprecated
    public static void useHms() {
    }
}
