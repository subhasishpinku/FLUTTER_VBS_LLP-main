package com.juztrentapp.juztrent;

import android.content.Context;
import android.content.Intent;
import android.graphics.Paint;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.NumberPicker;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.viewpager.widget.PagerAdapter;
import androidx.viewpager.widget.ViewPager;

import com.google.android.material.button.MaterialButton;

import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class ProductDitialsActivity extends AppCompatActivity {
    ViewPager viewPager;
    LinearLayout sliderDotspanel;
    private int dotscount;
    private ImageView[] dots;
    Timer timer;
    int page = 0;
    List<SliderUtils> sliderImg;
    TextView textView5;
    MaterialButton btn_add;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.productditials_activity);
        viewPager = (ViewPager) findViewById(R.id.viewPager);
        sliderDotspanel = (LinearLayout)findViewById(R.id.SliderDots);
        textView5 = (TextView)findViewById(R.id.textView5);
        btn_add = (MaterialButton)findViewById(R.id.btn_add);

        btn_add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(),ViewcardActvity.class);
                startActivity(intent);
            }
        });
        if (!textView5.getPaint().isStrikeThruText()) {
            textView5.setPaintFlags(textView5.getPaintFlags() | Paint.STRIKE_THRU_TEXT_FLAG);
        } else {
            textView5.setPaintFlags(textView5.getPaintFlags() & Paint.STRIKE_THRU_TEXT_FLAG);
        }
       ViewPagerAdapter viewPagerAdapter = new ViewPagerAdapter(getApplicationContext());
        viewPager.setAdapter(viewPagerAdapter);
        dotscount = viewPagerAdapter.getCount();
        dots = new ImageView[dotscount];
        for(int i = 0; i < dotscount; i++){
            dots[i] = new ImageView(getApplicationContext());
            dots[i].setImageDrawable(ContextCompat.getDrawable(getApplicationContext(), R.drawable.non_active_dot));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            params.setMargins(8, 0, 8, 0);
            sliderDotspanel.addView(dots[i], params);
        }
//
        http:
//www.sanktips.com/2017/10/15/how-to-fetch-images-from-server-to-image-slider-with-viewpager-in-android-studio/
        ///
        sliderImg = new ArrayList<>();
        sliderImg.clear();
        dots[0].setImageDrawable(ContextCompat.getDrawable(getApplicationContext(), R.drawable.active_dot));
        pageSwitcher(5);
        viewPager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {

            }
            @Override
            public void onPageSelected(int position) {

                for(int i = 0; i< dotscount; i++){
                    dots[i].setImageDrawable(ContextCompat.getDrawable(getApplicationContext(), R.drawable.non_active_dot));
                }

                dots[position].setImageDrawable(ContextCompat.getDrawable(getApplicationContext(), R.drawable.active_dot));

            }

            @Override
            public void onPageScrollStateChanged(int state) {

            }
        });
        viewPager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }

            @Override
            public void onPageSelected(int position) {
                for (int i = 0; i < dotscount; i++) {
                    dots[i].setImageDrawable(ContextCompat.getDrawable(getApplicationContext(), R.drawable.non_active_dot));
                }
                dots[position].setImageDrawable(ContextCompat.getDrawable(getApplicationContext(), R.drawable.active_dot));
            }

            @Override
            public void onPageScrollStateChanged(int state) {
            }
        });
    }

        public class ViewPagerAdapter extends PagerAdapter {
        private Context context;
        private LayoutInflater layoutInflater;
        private Integer [] images = {R.drawable.rectangle, R.drawable.rectangle,R.drawable.rectangle,R.drawable.rectangle,R.drawable.rectangle};
        public ViewPagerAdapter(Context context) {
            this.context = context;
        }
        @Override
        public int getCount() {
            return images.length;
        }
        @Override
        public boolean isViewFromObject(View view, Object object) {
            return view == object;
        }
        @Override
        public Object instantiateItem(ViewGroup container, final int position) {

            layoutInflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            View view = layoutInflater.inflate(R.layout.custom_layout, null);
            ImageView imageView = (ImageView) view.findViewById(R.id.imageView);
            imageView.setImageResource(images[position]);
            ViewPager vp = (ViewPager) container;
            vp.addView(view, 0);
            return view;
        }
        @Override
        public void destroyItem(ViewGroup container, int position, Object object) {
            ViewPager vp = (ViewPager) container;
            View view = (View) object;
            vp.removeView(view);
        }
    }
    public void pageSwitcher(int seconds) {
        timer = new Timer(); // At this line a new Thread will be created
        timer.scheduleAtFixedRate(new RemindTask(), 0, seconds * 1000); // delay
        // in
        // milliseconds
    }

    class RemindTask extends TimerTask {
        @Override
        public void run() {
            // As the TimerTask run on a seprate thread from UI thread we have
            // to call runOnUiThread to do work on UI thread.
            runOnUiThread(new Runnable() {
                public void run() {
                    if (page > 5) { // In my case the number of pages are 5
                        timer.cancel();
                        // Showing a toast for just testing purpose
                        //   Toast.makeText(getApplicationContext(), "Timer stoped",
                        //           Toast.LENGTH_LONG).show();

                        LsttoFirst();
                    } else {
                        viewPager.setCurrentItem(page++);
                    }
//                    if (page1 < 6) { // In my case the number of pages are 5
//                        timer.cancel();
//                        // Showing a toast for just testing purpose
//                        Toast.makeText(getApplicationContext(), "Timer stoped1",
//                                Toast.LENGTH_LONG).show();
//                    } else {
//                        viewPager.setCurrentItem(page++);
//                    }
                }
            });
        }
    }

    private void LsttoFirst() {
//        Toast.makeText(getApplicationContext(), "Timer Next",
//                Toast.LENGTH_LONG).show();
        final Handler handler = new Handler();
        final Runnable Update = new Runnable() {
            public void run() {
                int currentPage = viewPager.getCurrentItem();
                if (currentPage == page - 6) {
                    currentPage = 0;
                } else {
                    currentPage--;
                }
                viewPager.setCurrentItem(currentPage, true);
                handler.postDelayed(this, 5000);
            }
        };
        handler.postDelayed(Update, 500);
    }
}
