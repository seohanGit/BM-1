package com.baron.bm.utils;

import java.util.UUID;

public class CommonUtils {
    
    public static String getRandomString(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}