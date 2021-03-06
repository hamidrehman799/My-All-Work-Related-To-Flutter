package org.xms.g.utils;

public class XObject implements XGettable {
    private Object gInstance;

    public XObject(org.xms.g.utils.XBox xBox) {
        if (xBox == null) {
            return;
        }
        this.gInstance = xBox.getGInstance();
    }

    public Object getGInstance() {
        if (gInstance == null) {
            org.xms.g.utils.XmsLog.d("1", "gInstance is null ");
        } else {
            org.xms.g.utils.XmsLog.d("2", "gInstance : " + gInstance.getClass().getName());
        }
        return gInstance;
    }

    public void setGInstance(Object gInst){
        this.gInstance = gInst;
    }

    @Deprecated
    public boolean isSameAs(Object that) {
        if (that == null) {
            return false;
        }

        if (!(that instanceof XObject)) {
            return false;
        }

        return getGInstance() == ((XObject) that).getGInstance();
    }

    public static boolean isSame(Object one, Object another) {
        if (one == null) {
            return another == null;
        }
        if (one instanceof XObject) {
            return ((XObject) one).isSameAs(another);
        }
        return one == another;
    }
}
