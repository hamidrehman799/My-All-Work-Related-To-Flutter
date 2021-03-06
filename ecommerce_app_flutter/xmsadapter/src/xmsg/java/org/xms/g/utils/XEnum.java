package org.xms.g.utils;

public abstract class XEnum<E extends XEnum<E>> extends XObject implements Comparable<E> {
    public XEnum(org.xms.g.utils.XBox gInst) {
        super(gInst);
    }

    public final String name() {
        return ((Enum) getGInstance()).name();
    }

    public final int ordinal() {
        return ((Enum) getGInstance()).ordinal();
    }

    public final boolean equals(Object other) {
        if (!(other instanceof XEnum)) {
            return false;
        }
        return this.getGInstance() == ((XEnum) other).getGInstance();
    }

    public final int hashCode() {
        return getGInstance().hashCode();
    }

    public String toString() {
        return getGInstance().toString();
    }

    @Override
    public final void setGInstance(Object gInst) {
        throw new RuntimeException("");
    }

    public final int compareTo(E o) {
        XEnum<?> other = o;
        XEnum<E> self = this;
        if (self.getClass() != other.getClass() && self.getDeclaringClass() != other.getDeclaringClass()) {
            throw new ClassCastException();
        }
        return self.ordinal() - other.ordinal();
    }

    @SuppressWarnings("unchecked")
    public final Class<E> getDeclaringClass() {
        Class<?> clazz = getClass();
        Class<?> zuper = clazz.getSuperclass();
        return (zuper == Enum.class) ? (Class<E>) clazz : (Class<E>) zuper;
    }

    public static <T extends Enum<T>> T valueOf(Class<T> enumType, String name) {
        return java.lang.Enum.valueOf(enumType, name);
    }
}
