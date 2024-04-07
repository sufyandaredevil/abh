package com.apphacking.alarmpin;

import androidx.appcompat.app.AppCompatActivity;

import android.content.ContentResolver;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class UserProfile extends AppCompatActivity {

    String username;
    TextView textView;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_profile);

        textView = (TextView) findViewById(R.id.textView);
        Intent intent = getIntent();


        username = intent.getStringExtra("username");
        textView.setText(username);


        ContentResolver contentResolver = getContentResolver();



    }

    public void changeSettings(View view) {

        Intent intent = new Intent(this,ChangePin.class);
        intent.putExtra("username", username);
        startActivity(intent);

    }
}