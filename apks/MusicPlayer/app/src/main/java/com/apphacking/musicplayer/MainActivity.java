package com.apphacking.musicplayer;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.provider.DocumentsContract;
import android.view.View;
import android.widget.TextView;

import org.w3c.dom.Text;

import java.io.File;
import java.io.FileDescriptor;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;

public class MainActivity extends AppCompatActivity {

    Context context;
    MediaPlayer mediaPlayer;
    TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = (TextView) findViewById(R.id.textView);
        context = this.getApplicationContext();

        createSecretFile();

    }

    public void startMusic(View view) {

        // MediaPlayer
        mediaPlayer = MediaPlayer.create(context, R.raw.bothofus);

        // Start the music? :)
        mediaPlayer.start();

        // We could stop playing a music more than once but this is more funny! :)
        // if(state == true) {
        //  System.out.println("Do not start it again!");
        //}

        textView.setText(("Music is playing!"));

    }

    public void stopMusic(View view) {

        // Stop the music? :)
        mediaPlayer.stop();

        textView.setText(("Music stopped! :/"));
    }


    public void createSecretFile() {

        String filename = "mySecretFile";
        String fileContents = "This is my super secret text that noone should read!\n";

        try (FileOutputStream fos = context.openFileOutput(filename, Context.MODE_PRIVATE)) {
            fos.write(fileContents.getBytes(Charset.forName("UTF-8")));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    
}