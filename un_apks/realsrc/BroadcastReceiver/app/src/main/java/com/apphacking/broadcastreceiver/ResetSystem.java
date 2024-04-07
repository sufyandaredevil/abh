package com.apphacking.broadcastreceiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class ResetSystem extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {

        System.out.println("-------------------------------------");
        System.out.println("            System Reset!            ");
        System.out.println("-------------------------------------");
    }
}