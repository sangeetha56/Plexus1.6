/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.util;

/**
 *
 * @author Mayur
 */
public class DataUtil {
    /**
     *
     * @param source String Object
     * @return String Object
     */
    public static String emptyString(String source){
        String target="";
        if(source==null || source.equalsIgnoreCase("")){
            target="";

        }
        else{
            target=source;
        }
        return  target;
    }

    public static String emptyString1(String source){
        String target="";
        if(source==null || source.equalsIgnoreCase("")){
            target=null;

        }
        else{
            target=source;
        }
        return  target;
    }
    /**
     *
     * @param src
     * @return
     */
    public static short parseShort(String src){
        if(src==null || src.equalsIgnoreCase("")){
            return 0;
        }
        else{
            return Short.parseShort(src);
        }
        
    }
    /**
     *
     * @param src
     * @return
     */
    public static long parseLong(String src){
        if(src==null || src.equalsIgnoreCase("")){
            return 00;
        }
        else{
            return Long.parseLong(src);
        }

    }
    /**
     *
     * @param src
     * @return
     */
    public static double parseDouble(String src){
        if(src==null || src.equalsIgnoreCase("")){
            return 0.0;
        }
        else{
            return Double.parseDouble(src);
        }

    }

    public static long emptyLong(String source){
        long target=00;
        if(source==null || source.equalsIgnoreCase("")){
            target=00;

        }
        else{
            target=Long.parseLong(source);
        }
        return  target;
    }

    public static int emptyIntValueFromString(String src){
        //System.out.println("integer conversion");
        if(src==null || src.equalsIgnoreCase("")){
            return 00;
        }
        else{
            return Integer.parseInt(src);
        }

    }

  public static String emptyStringAvalue(String source){
        String target="";
        if(source==null || source.equalsIgnoreCase("")){
            target="null";

        }
        else{
            target=source;
        }
        return  target;
    }
    

}
