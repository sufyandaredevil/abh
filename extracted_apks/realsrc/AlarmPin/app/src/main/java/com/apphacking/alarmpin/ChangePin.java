package com.apphacking.alarmpin;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.w3c.dom.Text;

public class ChangePin extends AppCompatActivity {

    Context context;
    SharedPreferences sharedPref;

    EditText editText;
    TextView txtView;
    Button button;


    String username;
    String pin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_change_pin);

        context = this.getApplicationContext();

        editText = (EditText) findViewById(R.id.edt_pin);
        txtView = (TextView) findViewById(R.id.textView);
        button = (Button) findViewById(R.id.button);

        Intent intent = getIntent();
        username = intent.getStringExtra("username");


        if( username != null) {
            txtView.setText(username);
        } else {
            editText.setBackgroundResource(R.drawable.inputbackgrounddisabled);
            editText.setEnabled(false);
            editText.setHint("");
            button.setText("reset");
        }

    }




    public void changePin(View view) {

        pin = editText.getText().toString();
        sharedPref = context.getSharedPreferences("pin", Context.MODE_PRIVATE);

        if(username == null) {

            // only factory reset possible
            SharedPreferences.Editor editor = sharedPref.edit();
            editor.putString("pin", "1337");
            editor.apply();

            Toast.makeText(context, "Pin reset - successful!",Toast.LENGTH_LONG).show();

        } else {

            // only factory reset possible
            SharedPreferences.Editor editor = sharedPref.edit();
            editor.putString("pin", pin);
            editor.apply();

            Toast.makeText(context, "Pin updated - successful!",Toast.LENGTH_LONG).show();
        }

    }
}