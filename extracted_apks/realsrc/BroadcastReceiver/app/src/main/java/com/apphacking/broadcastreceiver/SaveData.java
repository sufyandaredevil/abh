package com.apphacking.broadcastreceiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class SaveData extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {

        // Battery is running low!
        System.out.println("###############################");
        System.out.println("           Save Data !         ");
        System.out.println("###############################");
    }
}