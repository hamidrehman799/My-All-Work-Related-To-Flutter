package org.xms.g.utils;

public class XBox {
    java.lang.Object hInst;

    public XBox(java.lang.Object hInst) {
        this.hInst = hInst;
    }

    public XBox(java.lang.Object gInst, java.lang.Object hInst) {
        this.hInst = hInst;
    }

    public Object getHInstance() {
        return hInst;
    }
}
