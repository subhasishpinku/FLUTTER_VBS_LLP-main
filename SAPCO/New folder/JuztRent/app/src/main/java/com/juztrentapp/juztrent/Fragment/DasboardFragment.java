package com.juztrentapp.juztrent.Fragment;
import android.app.ActionBar;
import android.app.Notification;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.Log;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TabHost;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.PagerSnapHelper;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.juztrentapp.juztrent.ItemManu;
import com.juztrentapp.juztrent.ItemManus;
import com.juztrentapp.juztrent.NotificationActivity;
import com.juztrentapp.juztrent.ProductActivity;
import com.juztrentapp.juztrent.ProductDitialsActivity;
import com.juztrentapp.juztrent.ProfileActivity;
import com.juztrentapp.juztrent.R;

import java.util.ArrayList;
import java.util.List;
public class DasboardFragment extends Fragment implements TabHost.OnTabChangeListener {
    private ActionBar toolbar;
    RecyclerView recyclerView,recyclerViews,recyclerViewsID;
    List<ItemManu> itemManus;
    List<ItemManus> itemManuses;
    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
    }
    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }
    @Override
    public void setUserVisibleHint(boolean isVisibleToUser) {
        super.setUserVisibleHint(isVisibleToUser);
        if (isVisibleToUser) {
            Log.e("TABB","000");
            getFragmentManager().beginTransaction().detach(this).attach(this).commit();
        }
    }
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.home_page, container, false);
         BottomNavigationView navigation = (BottomNavigationView)rootView.findViewById(R.id.navigation);
          navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);
        itemManus = new ArrayList<>();
        itemManuses = new ArrayList<>();
        recyclerView = rootView.findViewById(R.id.recyclerView);
        recyclerViews = rootView.findViewById(R.id.recyclerViews);
        recyclerViewsID = rootView.findViewById(R.id.recyclerViewsID);
        itemManus.add(
                new ItemManu(
                        "Lorem Ipsum",
                        R.drawable.category_1));
        itemManus.add(
                new ItemManu(
                        "Lorem Ipsum",
                        R.drawable.category_3));
        itemManus.add(
                new ItemManu(
                        "Lorem Ipsum",
                        R.drawable.category_4));
        itemManus.add(
                new ItemManu(
                        "Lorem Ipsum",
                        R.drawable.category_4));
        /////////////////////////////////////////////////
        itemManuses.add(
                new ItemManus(
                        "Lorem Ipsum","Enquiry",
                        R.drawable.dimg));
        itemManuses.add(
                new ItemManus(
                        "Lorem Ipsum","Enquiry",
                        R.drawable.dimg));
        itemManuses.add(
                new ItemManus(
                        "Lorem Ipsum","Enquiry",
                        R.drawable.dim1));
        itemManuses.add(
                new ItemManus(
                        "Lorem Ipsum","Enquiry",
                        R.drawable.dim1));
        // recyclerView.setBackgroundColor();
        ProductAdapter adapter = new ProductAdapter(getContext(), itemManus);
        recyclerView.setAdapter(adapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext(),
                LinearLayoutManager.HORIZONTAL, true));
        PagerSnapHelper snapHelper = new PagerSnapHelper();
        snapHelper.attachToRecyclerView(recyclerView);
        ////////////////////////////////////////
//        ProductAdapterview adapters = new ProductAdapterview(getContext(), itemManuses);
//        recyclerViews.setAdapter(adapters);
//        recyclerViews.setLayoutManager(new LinearLayoutManager(getContext(),
//                LinearLayoutManager.HORIZONTAL, true));

        RecyclerView.LayoutManager mLayoutManager = new GridLayoutManager(getActivity(), 4);
        recyclerViews.setLayoutManager(mLayoutManager);
        recyclerViews.setLayoutManager(new LinearLayoutManager(getContext(),
               LinearLayoutManager.HORIZONTAL, true));
        recyclerViews.addItemDecoration(new GridSpacingItemDecoration(4, dpToPx(5), true));
        recyclerViews.setItemAnimator(new DefaultItemAnimator());
        ProductAdapterview adapters = new ProductAdapterview(getContext(), itemManuses);
        recyclerViews.setAdapter(adapters);

        /////////////////////////////////////////////////////////
//        ProductAdapterviewrecommands adapterss = new ProductAdapterviewrecommands(getContext(), itemManuses);
//        recyclerViewsID.setAdapter(adapterss);
//        recyclerViewsID.setLayoutManager(new LinearLayoutManager(getContext(),
//                LinearLayoutManager.HORIZONTAL, true));

        RecyclerView.LayoutManager mLayoutManagers = new GridLayoutManager(getActivity(), 4);
        recyclerViewsID.setLayoutManager(mLayoutManagers);
        recyclerViewsID.setLayoutManager(new LinearLayoutManager(getContext(),
                LinearLayoutManager.HORIZONTAL, true));
        recyclerViewsID.addItemDecoration(new GridSpacingItemDecoration(4, dpToPx(5), true));
        recyclerViewsID.setItemAnimator(new DefaultItemAnimator());
        ProductAdapterviewrecommands adapterss = new ProductAdapterviewrecommands(getContext(), itemManuses);
        recyclerViewsID.setAdapter(adapterss);

        return rootView;
    }
    public class ProductAdapter extends RecyclerView.Adapter<ProductAdapter.ProductViewHolder> {
        private Context mCtx;
        private List<ItemManu> itemManuss;
        public ProductAdapter(Context mCtx, List<ItemManu> itemManuss) {
            this.mCtx = mCtx;
            this.itemManuss = itemManuss;
        }
        @Override
        public ProductAdapter.ProductViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            LayoutInflater inflater = LayoutInflater.from(mCtx);
            View view = inflater.inflate(R.layout.item_view, null);
            return new ProductAdapter.ProductViewHolder(view);
        }
        @Override
        public void onBindViewHolder(ProductAdapter.ProductViewHolder holder, int position) {
            ItemManu addsetget = itemManuss.get(position);
            holder.textId.setText(String.valueOf(addsetget.getItemNames()));
            holder.imageItem.setImageDrawable(mCtx.getResources().getDrawable(addsetget.getImg()));
            holder.lv.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent intent = new Intent(mCtx, ProductActivity.class);
                    startActivity(intent);
                }
            });
        }
        @Override
        public int getItemCount() {
            return itemManuss.size();
        }
        class ProductViewHolder extends RecyclerView.ViewHolder {
            TextView catid, textId;
            ImageView imageItem;
            LinearLayout lv;
            public ProductViewHolder(View itemView) {
                super(itemView);
                catid = itemView.findViewById(R.id.catid);
                textId = itemView.findViewById(R.id.textId);
                imageItem = itemView.findViewById(R.id.imageItem);
                lv = itemView.findViewById(R.id.lv);

            }
        }
    }

    public class ProductAdapterview extends RecyclerView.Adapter<ProductAdapterview.ProductViewHolder> {
        private Context mCtx;
        private List<ItemManus> itemManusss;
        public ProductAdapterview(Context mCtx, List<ItemManus> itemManusss) {
            this.mCtx = mCtx;
            this.itemManusss = itemManusss;
        }
        @Override
        public ProductAdapterview.ProductViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            LayoutInflater inflater = LayoutInflater.from(mCtx);
            View view = inflater.inflate(R.layout.item_viewws, null);
            return new ProductAdapterview.ProductViewHolder(view);
        }
        @Override
        public void onBindViewHolder(ProductAdapterview.ProductViewHolder holder, int position) {
            ItemManus addsetget = itemManusss.get(position);
            holder.textId.setText(String.valueOf(addsetget.getItemNames()));
            holder.ic_tv.setText(addsetget.getItembuttosnames());
            holder.imageItem.setImageDrawable(mCtx.getResources().getDrawable(addsetget.getImg()));
            holder.lv.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent intent = new Intent(mCtx, ProductDitialsActivity.class);
                    startActivity(intent);
                }
            });
        }
        @Override
        public int getItemCount() {
            return itemManusss.size();
        }
        class ProductViewHolder extends RecyclerView.ViewHolder {
            TextView catid, textId,ic_tv;
            ImageView imageItem;
            LinearLayout lv;
            public ProductViewHolder(View itemView) {
                super(itemView);
                catid = itemView.findViewById(R.id.catid);
                textId = itemView.findViewById(R.id.textId);
                imageItem = itemView.findViewById(R.id.imageItem);
                lv = itemView.findViewById(R.id.lv);
                ic_tv = itemView.findViewById(R.id.ic_tv);
            }
        }
    }

    public class ProductAdapterviewrecommands extends RecyclerView.Adapter<ProductAdapterviewrecommands.ProductViewHolder> {
        private Context mCtx;
        private List<ItemManus> itemManusss;
        public ProductAdapterviewrecommands(Context mCtx, List<ItemManus> itemManusss) {
            this.mCtx = mCtx;
            this.itemManusss = itemManusss;
        }
        @Override
        public ProductAdapterviewrecommands.ProductViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            LayoutInflater inflater = LayoutInflater.from(mCtx);
            View view = inflater.inflate(R.layout.item_viewws_recommands, null);
            return new ProductAdapterviewrecommands.ProductViewHolder(view);
        }
        @Override
        public void onBindViewHolder(ProductAdapterviewrecommands.ProductViewHolder holder, int position) {
            ItemManus addsetget = itemManusss.get(position);
            holder.textId.setText(String.valueOf(addsetget.getItemNames()));
            holder.ic_tv.setText(addsetget.getItembuttosnames());
            holder.imageItem.setImageDrawable(mCtx.getResources().getDrawable(addsetget.getImg()));
        }
        @Override
        public int getItemCount() {
            return itemManusss.size();
        }
        class ProductViewHolder extends RecyclerView.ViewHolder {
            TextView catid, textId,ic_tv;
            ImageView imageItem;
            LinearLayout lv;
            public ProductViewHolder(View itemView) {
                super(itemView);
                catid = itemView.findViewById(R.id.catid);
                textId = itemView.findViewById(R.id.textId);
                imageItem = itemView.findViewById(R.id.imageItem);
                lv = itemView.findViewById(R.id.lv);
                ic_tv = itemView.findViewById(R.id.ic_tv);
            }
        }
    }

    public class LinePagerIndicatorDecoration extends RecyclerView.ItemDecoration {

        private int colorActive = 0xFFFFFFFF;
        private int colorInactive = 0x66FFFFFF;
        //private int colorActive = 0xDE000000;
        // private int colorInactive = 0x33000000;
        private final float DP = Resources.getSystem().getDisplayMetrics().density;
        private final int mIndicatorHeight = (int) (DP * 16);
        private final float mIndicatorStrokeWidth = DP * 2;
        private final float mIndicatorItemLength = DP * 16;
        private final float mIndicatorItemPadding = DP * 4;
        private final Interpolator mInterpolator = new AccelerateDecelerateInterpolator();
        private final Paint mPaint = new Paint();
        public LinePagerIndicatorDecoration() {
            mPaint.setStrokeCap(Paint.Cap.ROUND);
            mPaint.setStrokeWidth(mIndicatorStrokeWidth);
            mPaint.setStyle(Paint.Style.STROKE);
            mPaint.setAntiAlias(true);
        }
        @Override
        public void onDrawOver(Canvas c, RecyclerView parent, RecyclerView.State state) {
            super.onDrawOver(c, parent, state);
            int itemCount = parent.getAdapter().getItemCount();
            float totalLength = mIndicatorItemLength * itemCount;
            float paddingBetweenItems = Math.max(0, itemCount - 1) * mIndicatorItemPadding;
            float indicatorTotalWidth = totalLength + paddingBetweenItems;
            float indicatorStartX = (parent.getWidth() - indicatorTotalWidth) / 2F;
            float indicatorPosY = parent.getHeight() - mIndicatorHeight / 2F;
            drawInactiveIndicators(c, indicatorStartX, indicatorPosY, itemCount);
            LinearLayoutManager layoutManager = (LinearLayoutManager) parent.getLayoutManager();
            int activePosition = layoutManager.findFirstVisibleItemPosition();
            if (activePosition == RecyclerView.NO_POSITION) {
                return;
            }
            final View activeChild = layoutManager.findViewByPosition(activePosition);
            int left = activeChild.getLeft();
            int width = activeChild.getWidth();
            float progress = mInterpolator.getInterpolation(left * -1 / (float) width);
            drawHighlights(c, indicatorStartX, indicatorPosY, activePosition, progress, itemCount);
        }
        private void drawInactiveIndicators(Canvas c, float indicatorStartX, float indicatorPosY, int itemCount) {
            mPaint.setColor(colorInactive);
            final float itemWidth = mIndicatorItemLength + mIndicatorItemPadding;
            float start = indicatorStartX;
            for (int i = 0; i < itemCount; i++) {
                // draw the line for every item
                c.drawLine(start, indicatorPosY, start + mIndicatorItemLength, indicatorPosY, mPaint);
                start += itemWidth;
            }
        }
        private void drawHighlights(Canvas c, float indicatorStartX, float indicatorPosY,
                                    int highlightPosition, float progress, int itemCount) {
            mPaint.setColor(colorActive);
            final float itemWidth = mIndicatorItemLength + mIndicatorItemPadding;
            if (progress == 0F) {
                // no swipe, draw a normal indicator
                float highlightStart = indicatorStartX + itemWidth * highlightPosition;
                c.drawLine(highlightStart, indicatorPosY,
                        highlightStart + mIndicatorItemLength, indicatorPosY, mPaint);
            } else {
                float highlightStart = indicatorStartX + itemWidth * highlightPosition;
                // calculate partial highlight
                float partialLength = mIndicatorItemLength * progress;

                // draw the cut off highlight
                c.drawLine(highlightStart + partialLength, indicatorPosY,
                        highlightStart + mIndicatorItemLength, indicatorPosY, mPaint);

                // draw the highlight overlapping to the next item as well
                if (highlightPosition < itemCount - 1) {
                    highlightStart += itemWidth;
                    c.drawLine(highlightStart, indicatorPosY,
                            highlightStart + partialLength, indicatorPosY, mPaint);
                }
            }
        }

        @Override
        public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
            super.getItemOffsets(outRect, view, parent, state);
            outRect.bottom = mIndicatorHeight;
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
    public class DividerItemDecoration extends RecyclerView.ItemDecoration {
        private  final int[] ATTRS = new int[]{android.R.attr.listDivider};
        private Drawable divider;
        public DividerItemDecoration(Context context) {
            final TypedArray styledAttributes = context.obtainStyledAttributes(ATTRS);
            divider = styledAttributes.getDrawable(0);
            styledAttributes.recycle();
        }
        public DividerItemDecoration(Context context, int resId) {
            divider = ContextCompat.getDrawable(context, resId);
        }
        @Override
        public void onDraw(Canvas c, RecyclerView parent, RecyclerView.State state) {
            int left = parent.getPaddingLeft();
            int right = parent.getWidth() - parent.getPaddingRight();
            int childCount = parent.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View child = parent.getChildAt(i);
                RecyclerView.LayoutParams params = (RecyclerView.LayoutParams) child.getLayoutParams();
                int top = child.getBottom() + params.bottomMargin;
                int bottom = top + divider.getIntrinsicHeight();
                divider.setBounds(left, top, right, bottom);
                divider.draw(c);
            }
        }
    }
    public class VerticalSpaceItemDecoration extends RecyclerView.ItemDecoration {
        private final int verticalSpaceHeight;
        public VerticalSpaceItemDecoration(int verticalSpaceHeight) {
            this.verticalSpaceHeight = verticalSpaceHeight;
        }
        @Override
        public void getItemOffsets(Rect outRect, View view, RecyclerView parent,
                                   RecyclerView.State state) {
            outRect.bottom = verticalSpaceHeight;
        }
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
                    Intent intent = new Intent(getContext(), ProfileActivity.class);
                    startActivity(intent);
                    return true;
                case R.id.ic_notification:
                    Intent intent1 = new Intent(getContext(), NotificationActivity.class);
                    startActivity(intent1);
                    return true;

            }
            return loadFragment(fragment);
        }
    };
    private boolean loadFragment(Fragment fragment) {
        if (fragment != null) {
            getActivity().getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.fragment_container, fragment)
                    .commit();
            return true;
        }
        return false;
    }
    @Override
    public void onTabChanged(String tabId) {
    }
    @Override
    public void onStart() {
        super.onStart();
    }
    @Override
    public void onResume() {
        super.onResume();
    }
    @Override
    public void onPause() {
        super.onPause();
    }
    @Override
    public void onStop() {
        super.onStop();
    }
    @Override
    public void onDestroyView() {
        super.onDestroyView();
    }
    @Override
    public void onDestroy() {
        super.onDestroy();
    }
    @Override
    public void onDetach() {
        super.onDetach();
    }

}

