package org.xms.g.utils;

public class XObject implements XGettable {
    private Object hInstance;

    public XObject(org.xms.g.utils.XBox xBox) {
        if (xBox == null) {
            return;
        }
        this.hInstance = xBox.getHInstance();
    }

    public Object getHInstance() {
        if (hInstance == null) {
            org.xms.g.utils.XmsLog.d("1", "hInstance is null ");
        } else {
            org.xms.g.utils.XmsLog.d("2", "hInstance : " + hInstance.getClass().getName());
        }
        return hInstance;
    }

    public void setHInstance(Object hInst){
        this.hInstance = hInst;
    }

    @Deprecated
    public boolean isSameAs(Object that) {
        if (that == null) {
            return false;
        }

        if (!(that instanceof XObject)) {
            return false;
        }

        return getHInstance() == ((XObject) that).getHInstance();
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
