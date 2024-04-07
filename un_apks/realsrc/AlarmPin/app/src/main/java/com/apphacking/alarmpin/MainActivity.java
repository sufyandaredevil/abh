package com.apphacking.alarmpin;

import androidx.appcompat.app.AppCompatActivity;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MainActivity extends AppCompatActivity {

    String username;
    String pin;

    EditText user;
    EditText pass;

    Context context;
    SharedPreferences sharedPref;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        context = this.getApplicationContext();

        user = (EditText) findViewById(R.id.edt_username);
        pass = (EditText) findViewById(R.id.edt_password);

        initPin();

    }


    public void login(View view) {

        username = user.getText().toString();
        pin = pass.getText().toString();

        if(username.equals("admin") && pin.equals(getPin())) {
            /**
             * Starting the next Activity
             * Providing additional information
             */
            Intent intent = new Intent(this, UserProfile.class);
            intent.putExtra("username","admin");
            startActivity(intent);
        } else {
            Toast.makeText(this,"PIN is incorrect!",Toast.LENGTH_LONG).show();
        }

    }

    public String getPin() {

        context = this.getApplicationContext();
        sharedPref = context.getSharedPreferences("pin", Context.MODE_PRIVATE);
        return sharedPref.getString("pin",null);

    }

    public void initPin() {

        String firstLogin = getPin();

        if(firstLogin == null) {
            context = this.getApplicationContext();
            sharedPref = context.getSharedPreferences("pin", Context.MODE_PRIVATE);
            SharedPreferences.Editor editor = sharedPref.edit();
            editor.putString("pin", "1337");
            editor.apply();
        }

    }

}