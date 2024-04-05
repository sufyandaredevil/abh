package com.apphacking.broadcastreceiver;

import androidx.appcompat.app.AppCompatActivity;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    TextView txtView;
    ImageView imageView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txtView = (TextView) findViewById(R.id.textView);
        imageView = (ImageView) findViewById(R.id.imageView);
        registerReceiver(alarmSystemReceiver,new IntentFilter("com.apphacking.broadcastreceiver.alarmState"));
    }


    private BroadcastReceiver alarmSystemReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String alarmState = "";

            alarmState = intent.getStringExtra("status"); // {status : arm}

            if(alarmState.equals("arm")) {

                // activate the alarm system
                txtView.setText("armed");
                imageView.setImageResource(R.drawable.lockclosed);
                Log.d("Alarm-State", "Alarm system armed!");

                return;

            } if (alarmState.equals("disarm")) {

                // deactivate the alarm system
                txtView.setText("disarmed");
                imageView.setImageResource(R.drawable.lockopen);
                Log.d("Alarm-State", "Alarm system disarmed!");

                return;

            } else {

                // status is unknown
                Log.d("Alarm-State", "Status Unknown!");

                return;
            }
        }
    };
}