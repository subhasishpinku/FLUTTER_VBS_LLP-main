package com.juztrentapp.juztrent;

import android.content.Intent;
import android.os.Bundle;
import android.text.SpannableString;
import android.text.style.UnderlineSpan;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.button.MaterialButton;

public class CreateAccount extends AppCompatActivity {
    TextView sigenID;
    MaterialButton sign_up;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_create_account);
        sigenID = (TextView)findViewById(R.id.sigenID);
        sign_up = (MaterialButton)findViewById(R.id.sign_up);
        SpannableString content = new SpannableString("Sign In");
        content.setSpan(new UnderlineSpan(), 0, content.length(), 0);
        sigenID.setText(content);
        sign_up.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(),NavigationDrawerActivity.class);
                startActivity(intent);
            }
        });
    }
}
