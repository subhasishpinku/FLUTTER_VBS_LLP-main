package com.juztrentapp.juztrent;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.juztrentapp.juztrent.Fragment.OrderHistoryFragment;

import java.util.ArrayList;
import java.util.List;
public class NotificationActivity extends AppCompatActivity {
    RecyclerView recyclerView;
    List<Notificationsetget> notificationsetgets;
    BottomNavigationView bottomNavigationView;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.notification_activity);
        recyclerView = (RecyclerView)findViewById(R.id.recyclerView);
        bottomNavigationView = (BottomNavigationView) findViewById(R.id.noti);
        bottomNavigationView.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);
        bottomNavigationView.setSelectedItemId(R.id.ic_notification);
        notificationsetgets = new ArrayList<>();
        notificationsetgets.add(
                new Notificationsetget(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
                        "25 days ago",
                        R.drawable.group));

        notificationsetgets.add(
                new Notificationsetget(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
                        "25 days ago",
                        R.drawable.group));

        notificationsetgets.add(
                new Notificationsetget(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
                        "25 days ago",
                        R.drawable.group));

        notificationsetgets.add(
                new Notificationsetget(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
                        "25 days ago",
                        R.drawable.group));
        notificationsetgets.add(
                new Notificationsetget(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
                        "25 days ago",
                        R.drawable.group));
        recyclerView.addItemDecoration(new GridSpacingItemDecoration(8, dpToPx(8), true));
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(getApplicationContext()));
        NotificationAdapter adapter = new NotificationAdapter(getApplicationContext(), notificationsetgets);
        recyclerView.setAdapter(adapter);
    }
    private BottomNavigationView.OnNavigationItemSelectedListener
            mOnNavigationItemSelectedListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {
        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            Fragment fragment = null;
            switch (item.getItemId()) {
                case R.id.ic_home:

                    return true;
                case R.id.ic_user:

                    return true;
                case R.id.ic_notification:

                    return true;

            }
            return loadFragment(fragment);
        }
    };
    private boolean loadFragment(Fragment fragment) {
        if (fragment != null) {
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.fragment_container, fragment)
                    .commit();
            return true;
        }
        return false;
    }
    public class NotificationAdapter extends RecyclerView.Adapter<NotificationAdapter.ProductViewHolder> {
        private Context mCtx;
        private List<Notificationsetget> notificationsetgets;
        public NotificationAdapter(Context mCtx, List<Notificationsetget> notificationsetgets) {
            this.mCtx = mCtx;
            this.notificationsetgets = notificationsetgets;
        }
        @Override
        public ProductViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            LayoutInflater inflater = LayoutInflater.from(mCtx);
            View view = inflater.inflate(R.layout.notification_view, null);
            return new ProductViewHolder(view);
        }
        @Override
        public void onBindViewHolder(ProductViewHolder holder, int position) {
            Notificationsetget notificationsetget = notificationsetgets.get(position);
            holder.text_view.setText(notificationsetget.getNotiname());
            holder.text_date.setText(notificationsetget.getNotidate());
            holder.imageView.setImageDrawable(mCtx.getResources().getDrawable(notificationsetget.getImg()));
        }
        @Override
        public int getItemCount() {
            return notificationsetgets.size();
        }
        class ProductViewHolder extends RecyclerView.ViewHolder {
            TextView text_date, text_view;
            ImageView imageView;
            public ProductViewHolder(View itemView) {
                super(itemView);
                text_date = itemView.findViewById(R.id.text_date);
                text_view = itemView.findViewById(R.id.text_view);
                imageView = itemView.findViewById(R.id.imageView);
            }
        }
    }
    public class GridSpacingItemDecoration extends RecyclerView.ItemDecoration {
        private int spanCount;
        private int spacing;
        private boolean includeEdge;

        public GridSpacingItemDecoration(int spanCount, int spacing, boolean includeEdge) {

            this.spanCount = spanCount;
            this.spacing = spacing;
            this.includeEdge = includeEdge;
        }

        @Override
        public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
            int position = parent.getChildAdapterPosition(view); // item position
            int column = position % spanCount; // item column

            if (includeEdge) {
                outRect.left = spacing - column * spacing / spanCount; // spacing - column * ((1f / spanCount) * spacing)
                outRect.right = (column + 1) * spacing / spanCount; // (column + 1) * ((1f / spanCount) * spacing)

                if (position < spanCount) { // top edge
                    outRect.top = spacing;
                }
                outRect.bottom = spacing; // item bottom
            } else {
                outRect.left = column * spacing / spanCount; // column * ((1f / spanCount) * spacing)
                outRect.right = spacing - (column + 1) * spacing / spanCount; // spacing - (column + 1) * ((1f /    spanCount) * spacing)
                if (position >= spanCount) {
                    outRect.top = spacing; // item top
                }
            }
        }
    }

    /**
     * Converting dp to pixel
     */
    private int dpToPx(int dp) {
        Resources r = getResources();
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dp, r.getDisplayMetrics()));
    }
}
