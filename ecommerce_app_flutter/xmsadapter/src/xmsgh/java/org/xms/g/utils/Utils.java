package org.xms.g.utils;

import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Class for Utils
 */
public class Utils {
    private static final Class XMS_BOX = XBox.class;

    private static Map<String, String> map = new HashMap<>();

    private static Map<String, String> mlGMSMap = new HashMap<>();

    private static Map<Class, Constructor> wrapperCache = new ConcurrentHashMap<>();

    private static Map<Class, Method> getZInstCache = new ConcurrentHashMap<>();

    private static final String G = "g";

    private static final String H = "h";

    /**
     * org.xms.g.utils.Utils.mapArray2GH(R[] array, Class<T> cls, boolean isH) transfer map array to GH.<br/>
     *
     * @param array array name
     * @param cls   class name
     * @param isH   is hms or not
     * @param <T>   T generic type
     * @param <R>   R generic type
     * @return array of T type
     */
    public static <T, R> T[] mapArray2GH(R[] array, Class<T> cls, boolean isH) {
        if (null == array) {
            org.xms.g.utils.XmsLog.w("1", "array is null");
            return null;
        }
        T[] result = (T[]) Array.newInstance(cls, array.length);
        for (int i = 0; i < array.length; i++) {
            result[i] = Utils.getInstanceInInterface(array[i], isH);
        }
        String arrayType = array.getClass().getName();
        String resultType = result.getClass().getName();
        org.xms.g.utils.XmsLog.i("2", "array : " + arrayType + " isH : " + isH + " result : " + resultType);
        return result;
    }

    private static class MappedIterator<R, T> implements Iterator<T> {
        Iterator<R> origin;

        Function<R, T> mapper;

        MappedIterator(Iterator<R> origin, Function<R, T> mapper) {
            this.origin = origin;
            this.mapper = mapper;
        }

        @Override
        public boolean hasNext() {
            return origin.hasNext();
        }

        @Override
        public T next() {
            return mapper.apply(origin.next());
        }

        @Override
        public void remove() {
            origin.remove();
        }
    }

    /**
     * org.xms.g.utils.Utils.transformIterable(Iterable<R> iterable, Function<R, T> mapper) trans form Iterable<R> to Iterable<T>.<br/>
     *
     * @param iterable iterable collection
     * @param mapper   instance of Function<R, T>
     * @param <R>      R generic type
     * @param <T>      T generic type
     * @return Iterable<T> collection
     */
    public static <R, T> Iterable<T> transformIterable(Iterable<R> iterable, Function<R, T> mapper) {
        if (iterable == null) {
            org.xms.g.utils.XmsLog.w("1", "iterable is null");
            return null;
        }
        Iterator<T> iter = new MappedIterator<>(iterable.iterator(), mapper);
        String iteratorType = iter == null ? null : iter.getClass().getName();
        org.xms.g.utils.XmsLog.i("1", "iterable : " + iterable.getClass().getName() + " result : " + iteratorType);
        return () -> iter;
    }

    /**
     * org.xms.g.utils.Utils.transformIterator(Iterator<R> iterator, Function<R, T> mapper) transform Iterator.<br/>
     *
     * @param iterator   iterator of R type
     * @param mapper mapper name
     * @param <T>    T generic type
     * @param <R>    R generic type
     * @return Iterator of T type
     */
    public static <R, T> Iterator<T> transformIterator(Iterator<R> iterator, Function<R, T> mapper) {
        if (iterator == null) {
            org.xms.g.utils.XmsLog.w("1", "iterator is null");
            return null;
        }
        Iterator<T> iter = new MappedIterator<>(iterator, mapper);
        String iteratorType = iter == null ? null : iter.getClass().getName();
        org.xms.g.utils.XmsLog.i("1", "iterator : " + iterator.getClass().getName() + " result : " + iteratorType);
        return iter;
    }

    /**
     * org.xms.g.utils.Utils.genericArrayCopy(R[] array, Class<T> type, Function<R, T> mapper) Copy generic array.<br/>
     *
     * @param array  array name
     * @param type   type name
     * @param mapper mapper name
     * @param <T>    T generic type
     * @param <R>    R generic type
     * @return array of T type
     */
    public static <T, R> T[] genericArrayCopy(R[] array, Class<T> type, Function<R, T> mapper) {
        if (array == null) {
            org.xms.g.utils.XmsLog.w("1", "array is null");
            return null;
        }
        T[] arr = (T[]) Array.newInstance(type, array.length);
        for (int i = 0; i < array.length; i++) {
            arr[i] = array[i] == null ? null : mapper.apply(array[i]);
        }
        String typeType = type == null ? null : type.getClass().getName();
        org.xms.g.utils.XmsLog.i("1",
                "array : " + array.getClass().getName() + " type : " + typeType + " result : " + arr.getClass().getName());
        return arr;
    }

    /**
     * org.xms.g.utils.Utils.convertMap(Map<T, V> map, Function<V, K> mapper) convert map from Map<T, V> to Map<T, K>.<br/>
     *
     * @param map    map name
     * @param mapper mapper name
     * @param <K>    K generic type
     * @param <V>    V generic type
     * @param <T>    T generic type
     * @return map with key of T type and value of K type
     */
    public static <K, V, T> Map<T, K> convertMap(Map<T, V> map, Function<V, K> mapper) {
        if (map == null) {
            org.xms.g.utils.XmsLog.w("1", "map is null");
            return null;
        }
        Map<T, K> returnMap = new HashMap<>();
        for (Map.Entry<T, V> entry : map.entrySet()) {
            returnMap.put(entry.getKey(), mapper.apply(map.get(entry.getKey())));
        }
        org.xms.g.utils.XmsLog.i("1",
                "map : " + map.getClass().getName() + " result : " + returnMap.getClass().getName());
        return returnMap;
    }

    /**
     * org.xms.g.utils.Utils.genericArrayCopy(android.util.SparseArray<R> array,Function<R, T> mapper) Copy generic array.<br/>
     *
     * @param array  array name
     * @param mapper mapper name
     * @param <T>    T generic type
     * @param <R>    R generic type
     * @return SparseArray of T type
     */
    public static <T, R> android.util.SparseArray<T> genericArrayCopy(android.util.SparseArray<R> array,
        Function<R, T> mapper) {
        if (array == null) {
            org.xms.g.utils.XmsLog.w("1", "array is null");
            return null;
        }
        android.util.SparseArray<T> arr = new android.util.SparseArray<>(array.size());
        for (int i = 0; i < array.size(); i++) {
            int key = array.keyAt(i);
            arr.put(key, mapper.apply(array.get(key)));
        }
        org.xms.g.utils.XmsLog.i("1",
                "array : " + array.getClass().getName() + " result : " + arr.getClass().getName());
        return arr;
    }

    /**
     * org.xms.g.utils.Utils.mapList(List<R> list, Function<R, T> mapper) Combine the list and the mapper to the mapList.<br/>
     *
     * @param list   list name
     * @param mapper mapper name
     * @param <T>    T generic type
     * @param <R>    R generic type
     * @return List of T type
     */
    public static <T, R> List<T> mapList(List<R> list, Function<R, T> mapper) {
        if (list == null) {
            org.xms.g.utils.XmsLog.i("1", "list is null");
            return null;
        }
        List<T> result = new ArrayList<>(list.size());
        if (list instanceof LinkedList) {
            result = new LinkedList();
        }
        for (R r : list) {
            result.add(mapper.apply(r));
        }
        String resultType = result.getClass().getName();
        org.xms.g.utils.XmsLog.i("2", "list : " + list.getClass().getName() + " result : " + resultType);
        return result;
    }

    /**
     * org.xms.g.utils.Utils.mapList2GH(List<R> list, boolean isH) tranfer from mapList to GH.<br/>
     *
     * @param list list name
     * @param isH  is hms or not
     * @param <T>  T generic type
     * @param <R>  R generic type
     * @return List of T type
     */
    public static <T, R> List<T> mapList2GH(List<R> list, boolean isH) {
        List<T> result = mapList(list, it -> getInstanceInInterface(it, isH));
        String listType = list == null ? null : list.getClass().getName();
        String resultType = result == null ? null : result.getClass().getName();
        org.xms.g.utils.XmsLog.i("1", "list : " + listType + " isH : " + isH + " result : " + resultType);
        return result;
    }

    /**
     * org.xms.g.utils.Utils.mapList2X(List<R> list, boolean isH) tranfer from mapList to X.<br/>
     *
     * @param list list name
     * @param isH  is hms or not
     * @param <T>  T generic type
     * @param <R>  R generic type
     * @return List of T type
     */
    public static <T, R> List<T> mapList2X(List<R> list, boolean isH) {
        List<T> result = isH ? mapList(list, it -> (T) getXmsObjectWithHmsObject(it))
                : mapList(list, it -> (T) getXmsObjectWithGmsObject(it));
        String listType = list == null ? null : list.getClass().getName();
        String resultType = result == null ? null : result.getClass().getName();
        org.xms.g.utils.XmsLog.i("1", "list : " + listType + " isH : " + isH + " result : " + resultType);
        return result;
    }

    /**
     * org.xms.g.utils.Utils.mapCollection(Collection<? extends R> collection, Function<R, T> mapper) get map collection.<br/>
     *
     * @param collection collection name
     * @param mapper     mapper name
     * @param <T>        T generic type
     * @param <R>        R generic type
     * @return Collection of T type
     */
    public static <T, R> Collection<T> mapCollection(Collection<? extends R> collection, Function<R, T> mapper) {
        if (collection == null) {
            org.xms.g.utils.XmsLog.i("0", "collection : null");
            return null;
        }
        String collectionType = collection.getClass().getName();
        Collection<T> result;
        if (collection instanceof Set) {
            int capacity = Math.max((int) ((float) collection.size() / 0.75F) + 1, 16);
            result = new HashSet<>(capacity);
        } else {
            result = new ArrayList<>(collection.size());
        }
        for (R item : collection) {
            result.add(mapper.apply(item));
        }
        String resultType = result.getClass().getName();
        org.xms.g.utils.XmsLog.i("1", "collection : " + collectionType + " result : " + resultType);
        return result;
    }

    /**
     * org.xms.g.utils.Utils.mapCollection2GH(Collection<R> collection, boolean isH) transfer mapCollection to GH.<br/>
     *
     * @param collection collection name
     * @param isH        is hms or not
     * @param <T>        T generic type
     * @param <R>        R generic type
     * @return Collection of T type
     */
    public static <T, R> Collection<T> mapCollection2GH(Collection<R> collection, boolean isH) {
        Collection<T> result = mapCollection(collection, it -> getInstanceInInterface(it, isH));
        String collectionType = collection == null ? null : collection.getClass().getName();
        String resultType = result == null ? null : result.getClass().getName();
        org.xms.g.utils.XmsLog.i("1", "collection : " + collectionType + " isH : " + isH + " result : " + resultType);
        return result;
    }

    /**
     * org.xms.g.utils.Utils.mapCollection2X(Collection<R> collection, boolean isH) transfer mapCollection to X.<br/>
     *
     * @param collection collection name
     * @param isH        is hms or not
     * @param <T>        T generic type
     * @param <R>        R generic type
     * @return Collection of T type
     */
    public static <T, R> Collection<T> mapCollection2X(Collection<R> collection, boolean isH) {
        Collection<T> result = isH ? mapCollection(collection, it -> (T) getXmsObjectWithHmsObject(it))
                : mapCollection(collection, it -> (T) getXmsObjectWithGmsObject(it));
        String collectionType = collection == null ? null : collection.getClass().getName();
        String resultType = result == null ? null : result.getClass().getName();
        org.xms.g.utils.XmsLog.i("1", "collection : " + collectionType + " isH : " + isH + " result : " + resultType);
        return result;
    }

    private static Object transformList2X(Object object, boolean isH, Map<String, String> xmsMap)
            throws IllegalAccessException, InstantiationException, ClassNotFoundException {
        if (!(object instanceof List)) {
            org.xms.g.utils.XmsLog.i("1", "object is not List");
            return object;
        }
        List result = (List) object.getClass().newInstance();
        for (int i = 0; i < ((List) object).size(); i++) {
            Object o = ((List) object).get(i);
            if (o == null || !xmsMap.containsKey(o.getClass().getCanonicalName())) {
                result.add(o);
                continue;
            }
            String xName = xmsMap.get(o.getClass().getCanonicalName());
            Class clazz = Class.forName(xName);
            result.add(getOrCreateInstance(clazz, o, isH));
        }
        String objectType = object == null ? null : object.getClass().getName();
        String resultType = result == null ? null : result.getClass().getName();
        org.xms.g.utils.XmsLog.i("2", "object : " + objectType + " isH : " + isH + " result : " + resultType);
        return result;
    }

    /**
     * org.xms.g.utils.Utils.getXmsObjectWithGmsObject(Object object) get the xms Object from the gms Object.<br/>
     *
     * @param object gms Object
     * @return xms Object
     */
    public static Object getXmsObjectWithGmsObject(Object object) {
        return getXmsObjectWithGmsObject(object, getXmsMap("NORMAL"));
    }

    public static Object getXmsObjectWithGmsObject(Object object, Map<String, String> xmsMap) {
        if (object == null) {
            return null;
        }
        if (object instanceof List) {
            try {
                return transformList2X(object, false, xmsMap);
            } catch (IllegalAccessException e) {
                org.xms.g.utils.XmsLog.e("2", e.getMessage(), e);
            } catch (InstantiationException e) {
                org.xms.g.utils.XmsLog.e("2", e.getMessage(), e);
            } catch (ClassNotFoundException e) {
                org.xms.g.utils.XmsLog.e("2", e.getMessage(), e);
            }
        }
        if (!isGmsType(object)) {
            return object;
        }
        org.xms.g.utils.XmsLog.i("1", "inObject : " + object.getClass().getName());
        return getXmsObject(object, G, xmsMap);
    }

    /**
     * org.xms.g.utils.Utils.getXmsObjectWithHmsObject(Object object) get the xms Object from the hms Object.<br/>
     *
     * @param object hms Object
     * @return xms Object
     */
    public static Object getXmsObjectWithHmsObject(Object object) {
        return getXmsObjectWithHmsObject(object, getXmsMap("NORMAL"));
    }

    public static Object getXmsObjectWithHmsObject(Object object, Map<String, String> xmsMap) {
        if (object == null) {
            return null;
        }
        if (object instanceof List) {
            try {
                return transformList2X(object, true, xmsMap);
            } catch (IllegalAccessException e) {
                org.xms.g.utils.XmsLog.e("2", e.getMessage(), e);
            } catch (InstantiationException e) {
                org.xms.g.utils.XmsLog.e("2", e.getMessage(), e);
            } catch (ClassNotFoundException e) {
                org.xms.g.utils.XmsLog.e("2", e.getMessage(), e);
            }
        }
        if (!isHmsType(object)) {
            return object;
        }
        org.xms.g.utils.XmsLog.i("1", "inObject : " + object.getClass().getName());
        return getXmsObject(object, H, xmsMap);
    }

    private static String getXmsInterfaceName(List<Class> interfaces, Map<String, String> xmsMap) {
        String result = null;
        if (interfaces == null || interfaces.isEmpty()) {
            return null;
        }
        for (Class oneInterface : interfaces) {
            String interfacesStr = oneInterface.getName().replaceAll("\\$", ".");
            if (xmsMap.containsKey(interfacesStr)) {
                result = xmsMap.get(interfacesStr);
                break;
            } else {
                result = getXmsInterfaceName(Arrays.asList(oneInterface.getInterfaces()), xmsMap);
                if (result != null) {
                    break;
                }
            }
        }
        return result;
    }

    public static Map<String, String> getXmsMap(String mapType) {
        switch (mapType) {
            case "ML_GMS":
                return mlGMSMap;
            case "NORMAL":
            default:
                return map;
        }
    }

    private static Object getXmsObject(Object object, String GorH, Map<String, String> xmsMap) {
        String interfaceClass = null;
        Class inSuperClass = object.getClass().getSuperclass();
        List<Class> interfaces = new ArrayList<>(Arrays.asList(object.getClass().getInterfaces()));
        String inClassName = object.getClass().getName();
        inClassName = inClassName.replaceAll("\\$", ".");
        while (!xmsMap.containsKey(inClassName)) {
            inClassName = inSuperClass.getName().replaceAll("\\$", ".");
            if (inClassName.equals("java.lang.Object")) {
                interfaceClass = getXmsInterfaceName(interfaces, xmsMap);
                org.xms.g.utils.XmsLog.d("2", "interfaceClass : " + interfaceClass);
                break;
            } else {
                Collections.addAll(interfaces, inSuperClass.getInterfaces());
                inSuperClass = inSuperClass.getSuperclass();
            }
        }
        String xmsClassName = xmsMap.get(inClassName);
        org.xms.g.utils.XmsLog.i("1", "inClassName : " + inClassName + ", xmsClassName : " + xmsClassName);
        if (xmsClassName == null) {
            if (interfaceClass != null) {
                xmsClassName = interfaceClass;
                org.xms.g.utils.XmsLog.i("5", "xmsClassName : " + xmsClassName);
            } else {
                org.xms.g.utils.XmsLog.i("6", "xmsClassName is null");
                return object;
            }
        }

        try {
            Class clazz = Class.forName(xmsClassName);
            org.xms.g.utils.XmsLog.i("7", "clazz : " + clazz.getName());
            Constructor[] constructors = clazz.getConstructors();
            for (Constructor constructor : constructors) {
                if (constructor.getParameterTypes().length == 1
                        && constructor.getParameterTypes()[0] == XMS_BOX) {
                    return "g".equals(GorH) ? constructor.newInstance(new XBox(object, null))
                            : constructor.newInstance(new XBox(null, object));
                }
            }
        } catch (ClassNotFoundException e) {
            org.xms.g.utils.XmsLog.e("8", e.getMessage(), e);
        } catch (IllegalAccessException e) {
            org.xms.g.utils.XmsLog.e("9", e.getMessage(), e);
        } catch (InstantiationException e) {
            org.xms.g.utils.XmsLog.e("10", e.getMessage(), e);
        } catch (InvocationTargetException e) {
            org.xms.g.utils.XmsLog.e("11", e.getMessage(), e);
        }
        return null;
    }

    /**
     * org.xms.g.utils.Utils.isGmsClass(String className) judge if the class is of gms class or not.<br/>
     *
     * @param className input class name
     * @return true if the class is of gms class, otherwise false.
     */
    public static boolean isGmsClass(String className) {
        if (className.startsWith("com.google.android.gms") || className.startsWith("com.google.firebase")
                || className.startsWith("com.google.ads") || className.startsWith("com.android.installreferrer")
                || className.startsWith("com.google.android.libraries") || className.startsWith("com.google.api")) {
            org.xms.g.utils.XmsLog.i("1", "true");
            return true;
        }
        org.xms.g.utils.XmsLog.i("2", "false");
        return false;
    }

    /**
     * org.xms.g.utils.Utils.isHmsClass(String className) judge if the class is of hms class or not.<br/>
     *
     * @param className input class name
     * @return true if the class is of hms class, otherwise false.
     */
    public static boolean isHmsClass(String className) {
        if (className.startsWith("com.huawei.hms") || className.startsWith("com.huawei.hmf")
                || className.startsWith("com.huawei.agconnect")) {
            org.xms.g.utils.XmsLog.i("1", "true");
            return true;
        }
        org.xms.g.utils.XmsLog.i("2", "false");
        return false;
    }

    /**
     * org.xms.g.utils.Utils.isGmsType(Object obj) judge if the class is of gms type or not.<br/>
     *
     * @param obj input object name
     * @return true if the object is of gms type, otherwise false.
     */
    public static boolean isGmsType(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj.getClass().isAnonymousClass() || obj.getClass().isMemberClass()) {
            if (isGmsClass(obj.getClass().getName())) {
                return true;
            }
            if (obj.getClass().getSuperclass().getName().equals("java.lang.Object")) {
                Class[] superInterfaces = obj.getClass().getInterfaces();
                for (Class inter : superInterfaces) {
                    return isGmsClass(inter.getName());
                }
            } else {
                Class superClassName = obj.getClass().getSuperclass();
                return isGmsClass(superClassName.getName());
            }
        }
        return isGmsClass(obj.getClass().getName());
    }

    /**
     * org.xms.g.utils.Utils.isHmsType(Object obj) judge if the class is of hms type or not.<br/>
     *
     * @param obj input object name
     * @return true if the object is of hms type, otherwise false.
     */
    public static boolean isHmsType(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj.getClass().isAnonymousClass() || obj.getClass().isMemberClass()) {
            if (isHmsClass(obj.getClass().getName())) {
                return true;
            }
            if (obj.getClass().getSuperclass().getName().equals("java.lang.Object")) {
                Class[] superInterfaces = obj.getClass().getInterfaces();
                for (Class inter : superInterfaces) {
                    return isHmsClass(inter.getName());
                }
            } else {
                Class superClassName = obj.getClass().getSuperclass();
                return isHmsClass(superClassName.getName());
            }
        }
        return isHmsClass(obj.getClass().getName());
    }

    /**
     * org.xms.g.utils.Utils.getGmsClassWithXmsClass(Class xmsClass) get the gms class from the xms class.<br/>
     *
     * @param xmsClass xms class name
     * @return gms class
     */
    public static Class getGmsClassWithXmsClass(Class xmsClass) {
        return getGmsClassWithXmsClass(xmsClass, getXmsMap("NORMAL"));
    }

    public static Class getGmsClassWithXmsClass(Class xmsClass, Map<String, String> xmsMap) {
        String xmsName = xmsClass.getName();
        if (!xmsMap.containsValue(xmsName)) {
            return xmsClass;
        }
        for (Map.Entry<String, String> entry : xmsMap.entrySet()) {
            String targetKey = entry.getKey();
            if (xmsName.equals(entry.getValue()) && isGmsClass(targetKey)) {
                try {
                    return Class.forName(targetKey);
                } catch (ClassNotFoundException e) {
                    return xmsClass;
                }
            }
        }
        return xmsClass;
    }

    /**
     * org.xms.g.utils.Utils.getHmsClassWithXmsClass(Class xmsClass) get the hms class from the xms class.<br/>
     *
     * @param xmsClass xms class name
     * @return hms class
     */
    public static Class getHmsClassWithXmsClass(Class xmsClass) {
        return getHmsClassWithXmsClass(xmsClass, getXmsMap("NORMAL"));
    }

    public static Class getHmsClassWithXmsClass(Class xmsClass, Map<String, String> xmsMap) {
        String xmsName = xmsClass.getName();
        if (!xmsMap.containsValue(xmsName)) {
            return xmsClass;
        }
        for (Map.Entry<String, String> entry : xmsMap.entrySet()) {
            String targetKey = entry.getKey();
            if (xmsName.equals(entry.getValue()) && isHmsClass(targetKey)) {
                try {
                    return Class.forName(targetKey);
                } catch (ClassNotFoundException e) {
                    return xmsClass;
                }
            }
        }
        return xmsClass;
    }

    /**
     * org.xms.g.utils.Utils.isXmsType(Class clazz) Tell a clazz is xms type or not.<br/>
     *
     * @param clazz the clazz need to be identified.
     * @return if clazz is xms type, return true.
     */
    public static boolean isXmsType(Class clazz) {
        boolean result = XInterface.class.isAssignableFrom(clazz);
        org.xms.g.utils.XmsLog.i("1", "isXmsType : " + result);
        return result;
    }

    /**
     * org.xms.g.utils.Utils.getOrCreateInstance(Class clazz, Object zInst, boolean isH) Create an instance from its Class, and we MUST use its wrapper constructor.<br>
     *
     * @param clazz Create an instance from clazz.
     * @param zInst parameter for constructor.
     * @return the instance.
     */
    public static Object getOrCreateInstance(Class clazz, Object zInst, boolean isH) {
        if (zInst == null) {
            org.xms.g.utils.XmsLog.i("1", "instance : null");
            return null;
        }
        if (zInst instanceof List) {
            org.xms.g.utils.XmsLog.i("2", "instance is List");
            return mapList2X((List) zInst, isH);
        }

        if (!isXmsType(clazz)) {
            org.xms.g.utils.XmsLog.i("3", "instance : " + zInst.getClass().getName());
            if (isH) {
                return getXmsObjectWithHmsObject(zInst);
            }
            return getXmsObjectWithGmsObject(zInst);
        }

        String className = "";
        if (clazz.isInterface() || Modifier.isAbstract(clazz.getModifiers())) {
            className = clazz.getName();
            className += "$XImpl";
            try {
                org.xms.g.utils.XmsLog.d("4", "className : " + className);
                clazz = Class.forName(className);
            } catch (ClassNotFoundException e) {
                org.xms.g.utils.XmsLog.e("5", e.getMessage(), e);
            }
        }

        Constructor constructor = getWrapperConstructor(clazz);
        XBox param = isH ? new XBox(null, zInst) : new XBox(zInst, null);
        if (constructor != null) {
            try {
                return constructor.newInstance(param);
            } catch (InstantiationException e) {
                org.xms.g.utils.XmsLog.e("6", e.getMessage(), e);
            } catch (IllegalAccessException e) {
                org.xms.g.utils.XmsLog.e("7", e.getMessage(), e);
            } catch (InvocationTargetException e) {
                org.xms.g.utils.XmsLog.e("8", e.getMessage(), e);
            }
        }

        return null;
    }

    /**
     * org.xms.g.utils.Utils.getWrapperConstructor(Class xmsType) Find wrapper constructor for an xms class.<br/>
     *
     * @param xmsType the class whose wrapper constructor need to be found.
     * @return xmsType's wrapper constructor.
     */
    public static Constructor getWrapperConstructor(Class xmsType) {
        if (wrapperCache.containsKey(xmsType)) {
            org.xms.g.utils.XmsLog.i("1", "wrapperCache.get(xmsType) xmsType : " + xmsType.getName());
            return wrapperCache.get(xmsType);
        }

        Constructor[] constructors = xmsType.getConstructors();
        for (Constructor constructor : constructors) {
            if (constructor.getParameterTypes().length != 1) {
                continue;
            }

            if (constructor.getParameterTypes()[0] == XMS_BOX) {
                wrapperCache.put(xmsType, constructor);
                XmsLog.i("2",
                        "wrapperCache.put(xmsType, constructors[i]) xmsType : " + xmsType.getName());
                return constructor;
            } else {
                XmsLog.w("3",
                        "map not containsKey " + constructor.getParameterTypes()[0].getCanonicalName());
            }
        }

        return null;
    }

    /**
     * org.xms.g.utils.Utils.getInstanceInInterface(Object o, boolean isH) If an object is xms instance, get its G instance or H instance.An xms object may be an XGettable instance, then it has a concrete g instance,also, it may be an XInterface but not XGettable, we must call these methods by reflection.<br/>
     *
     * @param o   object to get its g instance.
     * @param isH show we need its g or h instance.
     * @return xms object's g/h instance.
     */
    public static <T> T getInstanceInInterface(Object o, boolean isH) {
        if (!(o instanceof XInterface)) {
            String inObjectType = o == null ? null : o.getClass().getName();
            org.xms.g.utils.XmsLog.i("1", "inObject : " + inObjectType);
            return (T) o;
        }

        if (o instanceof XGettable) {
            if (isH) {
                org.xms.g.utils.XmsLog.i("2", "hInstance : " + ((XGettable) o).getHInstance().getClass().getName());
                return (T) ((XGettable) o).getHInstance();
            } else {
                org.xms.g.utils.XmsLog.i("3", "gInstance : " + ((XGettable) o).getGInstance().getClass().getName());
                return (T) ((XGettable) o).getGInstance();
            }
        }

        return (T) reflectiveGetInstance(o, isH);
    }

    private static Object reflectiveGetInstance(Object o, boolean isH) {
        if (getZInstCache.containsKey(o.getClass())) {
            org.xms.g.utils.XmsLog.i("1", "inObject : " + o.getClass());
            try {
                return getZInstCache.get(o.getClass()).invoke(o);
            } catch (IllegalAccessException e) {
                org.xms.g.utils.XmsLog.i("2", "inObject : " + o.getClass(), e);
            } catch (InvocationTargetException e) {
                org.xms.g.utils.XmsLog.i("3", "inObject : " + o.getClass(), e);
            }
        }

        Method[] methods = o.getClass().getMethods();
        for (Method method : methods) {
            if (method.getParameterTypes().length > 0) {
                continue;
            }

            if (isH && (!method.getName().startsWith("getHInstance"))) {
                continue;
            }

            if (!isH && (!method.getName().startsWith("getGInstance"))) {
                continue;
            }

            XmsLog.i("2", "inObject : " + o.getClass() + ", methods[i] : " + method.getName());
            getZInstCache.put(o.getClass(), method);
            try {
                return method.invoke(o);
            } catch (IllegalAccessException e) {
                XmsLog.e("3", e.getMessage(), e);
            } catch (InvocationTargetException e) {
                XmsLog.e("4", e.getMessage(), e);
            }
        }

        return null;
    }

    private static Object[] wrapZType(Object[] objects, Class[] types, boolean isH) {
        Object[] xmsObj = new Object[objects.length];
        for (int i = 0; i < objects.length; i++) {
            xmsObj[i] = Utils.getOrCreateInstance(types[i], objects[i], isH);
        }
        if (xmsObj.length > 0) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < xmsObj.length; i++) {
                String argsType = xmsObj[i] == null ? null : xmsObj[i].getClass().getName();
                sb.append("XMS Types [").append(i).append("] : ").append(argsType).append(", ");
            }
            org.xms.g.utils.XmsLog.i("1", sb.toString());
        }
        return xmsObj;
    }

    /**
     * org.xms.g.utils.Utils.getBridgedMethod(Object receiver, String methodName, Class[] paramTypes) get bridged method.<br/>
     *
     * @param receiver   receiver name
     * @param methodName method name
     * @param paramTypes param types
     * @return bridged method
     * @throws NoSuchMethodException can not find such method
     */
    public static Method getBridgedMethod(Object receiver, String methodName, Class[] paramTypes) throws NoSuchMethodException {
        Method bridgeMethod = BridgeMethodUtils.getBridgeMethod(receiver.getClass(), methodName, paramTypes);
        org.xms.g.utils.XmsLog.d("1", "get bridge method " + bridgeMethod.toString());
        Method bridgedMethod = BridgeMethodUtils.getBridgedMethod(bridgeMethod);
        org.xms.g.utils.XmsLog.d("2", "get bridged method " + bridgedMethod.toString());
        String bridgeMethodType = bridgeMethod.getName();
        String bridgedMethodMethodType = bridgedMethod.getName();
        org.xms.g.utils.XmsLog.d("3",
                "bridgeMethod : " + bridgeMethodType + ", bridgedMethod : " + bridgedMethodMethodType);
        return bridgedMethod;
    }

    /**
     * org.xms.g.utils.Utils.getXmsRetObj(Object receiver, String methodName, Object returnObj, Class[] paramTypes, boolean isH) Get xms type by Invoking the bridge method with the original return types.<br/>
     *
     * @param receiver   the invoke target
     * @param methodName the method name
     * @param returnObj  return object
     * @param paramTypes the declaration types of parameters (the upper bound type for the generic type)
     * @param isH        HMS if true; GMS, otherwise
     * @return xms object
     */
    public static Object getXmsRetObj(Object receiver, String methodName, Object returnObj, Class[] paramTypes, boolean isH) {
        if (returnObj == null) {
            org.xms.g.utils.XmsLog.w("1", "returnObj == null");
            throw new IllegalArgumentException("return object can not be null!");
        }

        if (paramTypes == null) {
            org.xms.g.utils.XmsLog.w("2", "paramTypes == null");
            throw new IllegalArgumentException("parameter types object can not be null!");
        }

        Method bridgedMethod;
        try {
            bridgedMethod = getBridgedMethod(receiver, methodName, paramTypes);
        } catch (NoSuchMethodException e) {
            return isH ? getXmsObjectWithHmsObject(returnObj) : getXmsObjectWithGmsObject(returnObj);
        }
        Class<?> returnType = bridgedMethod.getReturnType();
        return wrapZType(new Object[]{returnObj}, new Class[]{returnType}, isH)[0];
    }

    public static Object invokeMethod(Object receiver, String methodName, Object[] params, Class[] paramTypes,
                                      boolean isH) throws IllegalStateException {
        return invokeMethod(receiver, methodName, params, paramTypes, isH, getXmsMap("NORMAL"));
    }

    /**
     * org.xms.g.utils.Utils.invokeMethod(Object receiver, String methodName, Object[] params, Class[] paramTypes,boolean isH) Invoke the bridge method with the original parameter types.<br/>
     *
     * @param receiver   the invoke target
     * @param methodName the method name
     * @param params     parameters
     * @param paramTypes the declaration types of parameters (the upper bound type for the generic type)
     * @param isH        HMS if true; GMS, otherwise
     * @param xmsMap     XMS relation map
     * @return the return value
     * @throws IllegalStateException capsuling the real refection exception
     */
    public static Object invokeMethod(Object receiver, String methodName, Object[] params, Class[] paramTypes,
                                      boolean isH, Map<String, String> xmsMap) throws IllegalStateException {
        if (params == null) {
            org.xms.g.utils.XmsLog.w("1", "params == null");
            throw new IllegalArgumentException("null params");
        }

        if (paramTypes == null) {
            org.xms.g.utils.XmsLog.w("2", "paramTypes == null");
            throw new IllegalArgumentException("null paramTypes");
        }

        if (params.length != paramTypes.length) {
            org.xms.g.utils.XmsLog.w("3", "params.length != paramTypes.length");
            throw new IllegalArgumentException("mismatched params and paramTypes");
        }

        Method bridgedMethod;
        try {
            bridgedMethod = getBridgedMethod(receiver, methodName, paramTypes);
        } catch (NoSuchMethodException e) {
            return invokeImprecise(receiver, methodName, params, paramTypes, isH, xmsMap);
        }
        org.xms.g.utils.XmsLog.i("4", "receiver : " + receiver.getClass().getName());
        try {
            Class<?>[] types = bridgedMethod.getParameterTypes();
            Object[] args = wrapZType(params, types, isH);
            bridgedMethod.setAccessible(true);
            return bridgedMethod.invoke(receiver, args);
        } catch (Exception ex) {
            org.xms.g.utils.XmsLog.e("5", ex.getMessage(), ex);
            throw new IllegalStateException(ex);
        }
    }

    /**
     * org.xms.g.utils.Utils.invokeImprecise(Object receiver, String methodName, Object[] paramObj, Class[] upperBoundType, boolean isH) invoke imprecise.<br/>
     *
     * @param receiver       the invoke target
     * @param methodName     the method name
     * @param paramObj       parameters
     * @param upperBoundType type of upper boundary
     * @param isH            is hms or not
     * @return Object
     */
     public static Object invokeImprecise(Object receiver, String methodName, Object[] paramObj, Class[] upperBoundType, boolean isH, Map<String, String> xmsMap) {
        Object[] xmsObj = new Object[paramObj.length];
        for (int i = 0; i < paramObj.length; i++) {
            xmsObj[i] = isH ? getXmsObjectWithHmsObject(paramObj[i], xmsMap) : getXmsObjectWithGmsObject(paramObj[i], xmsMap);
        }
        Method[] methods = receiver.getClass().getMethods();
        Method method = getDeclaredMethod(methods, methodName, upperBoundType);
        try {
            return method.invoke(receiver, xmsObj);
        } catch (Exception ex) {
            org.xms.g.utils.XmsLog.e("1", ex.getMessage(), ex);
            throw new IllegalStateException(ex);
        }
    }

    private static Method getDeclaredMethod(Method[] methods, String methodName, Class[] upperBoundType) {
        for (Method method : methods) {
            if (!method.getName().equals(methodName) || method.getParameterTypes().length != upperBoundType.length) {
                continue;
            }
            Class[] paramTypes = method.getParameterTypes();
            for (int i = 0; i < paramTypes.length; i++) {
                if (!upperBoundType[i].isAssignableFrom(paramTypes[i])) {
                    break;
                }
                if (i == paramTypes.length - 1) {
                    return method;
                }
            }
        }
        throw new IllegalStateException("No such method!");
    }

    /**
     * org.xms.g.utils.Utils.handleInvokeBridgeReturnValue(Object receiver, boolean isH) handle invokeBridge method return value.return value need type cast.<br/>
     *
     * @param receiver the invoke target
     * @param isH      HMS if true; GMS, otherwise
     * @return the return value
     */
    public static Object handleInvokeBridgeReturnValue(Object receiver, boolean isH) {
        if (!isXmsType(receiver.getClass())) {
            org.xms.g.utils.XmsLog.d("1", "receiver : " + receiver.getClass().getName());
            return receiver;
        }
        if (receiver instanceof XGettable) {
            if (isH) {
                org.xms.g.utils.XmsLog.i("2",
                        "hInstance : " + ((XGettable) receiver).getHInstance().getClass().getName());
                return ((XGettable) receiver).getHInstance();
            }
            org.xms.g.utils.XmsLog.i("3", "gInstance : " + ((XGettable) receiver).getGInstance().getClass().getName());
            return ((XGettable) receiver).getGInstance();
        }
        Method[] methods = receiver.getClass().getMethods();
        int cnt = 0;
        String prefix = isH ? "getHInstance" : "getGInstance";
        Method target = null;
        for (Method m : methods) {
            if (m.getName().startsWith(prefix)) {
                cnt++;
                target = m;
            }
        }
        if (cnt == 1) {
            try {
                org.xms.g.utils.XmsLog.i("4", "receiver : " + receiver.getClass().getName());
                return target.invoke(receiver);
            } catch (IllegalAccessException e) {
                org.xms.g.utils.XmsLog.e("5", e.getMessage(), e);
            } catch (InvocationTargetException e) {
                org.xms.g.utils.XmsLog.e("6", e.getMessage(), e);
            }
        }
        IllegalStateException illegalStateException = new IllegalStateException("multiple getInstance methods found.");
        org.xms.g.utils.XmsLog.w("7", illegalStateException.getMessage());
        throw illegalStateException;
    }

    /**
     * org.xms.g.utils.Utils.invokeProtectMethod(Object receiver, Class targetClass, String methodName, Class[] methodParametersType, Object[] args) invoke protect method.<br/>
     *
     * @param receiver             the invoke target
     * @param targetClass          the target class
     * @param methodName           the method name
     * @param methodParametersType the type of method parameters
     * @param args                 the arguments
     * @return the Object
     */
    public static Object invokeProtectMethod(Object receiver, Class targetClass, String methodName,
                                             Class[] methodParametersType, Object[] args) {
        if (targetClass == null) {
            throw new IllegalStateException("null class.");
        }
        if (methodName == null || methodName.isEmpty()) {
            throw new IllegalStateException("methodName does not exist.");
        }
        try {
            Method method = targetClass.getDeclaredMethod(methodName, methodParametersType);
            if (method == null) {
                throw new IllegalStateException("method does not exist.");
            }
            method.setAccessible(true);
            return method.invoke(receiver, args);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        return null;
    }

    static {
        
        
        
    }
}
