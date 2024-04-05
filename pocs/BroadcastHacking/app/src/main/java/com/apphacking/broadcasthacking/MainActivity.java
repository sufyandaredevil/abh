package com.apphacking.broadcasthacking;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;


public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }


    public void disarmAlarmSystem(View view) {

        Intent intent = new Intent();
        intent.setAction("com.apphacking.broadcastreceiver.alarmState");
        intent.putExtra("status","arm");
        sendBroadcast(intent);
    }


}