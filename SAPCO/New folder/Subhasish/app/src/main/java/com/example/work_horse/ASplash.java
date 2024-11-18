package com.example.work_horse;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

public class ASplash extends AppCompatActivity {
    ImageView ivIcon;
    TextView skip_id;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_asplash);
        ivIcon = (ImageView)findViewById(R.id.ivIcon);
        skip_id = (TextView)findViewById(R.id.skip_id);
//        Animation animation = AnimationUtils.loadAnimation(getApplicationContext(), R.anim.blinking);
//        ivIcon.startAnimation(animation);
        skip_id.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(),BSplash.class);
                startActivity(intent);
            }
        });
    }
}
