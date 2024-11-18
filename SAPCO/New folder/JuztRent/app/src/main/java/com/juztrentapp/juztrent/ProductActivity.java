package com.juztrentapp.juztrent;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.PagerSnapHelper;
import androidx.recyclerview.widget.RecyclerView;

import com.juztrentapp.juztrent.Fragment.DasboardFragment;

import java.util.ArrayList;
import java.util.List;

public class ProductActivity extends AppCompatActivity {
    RecyclerView recyclerView,recyclerViews;
    List<ItemManu> itemManus;
    List<ItemManuview> itemManuses;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.discoverourtproduct_activity);
        itemManus = new ArrayList<>();
        itemManuses = new ArrayList<>();
        recyclerView = findViewById(R.id.recyclerView);
        recyclerViews = findViewById(R.id.recyclerViews);
        itemManus.add(
                new ItemManu(
                        "Lorem Ipsum",
                        R.drawable.category_3));
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
                new ItemManuview(
                        "Lorem Ipsum","Enquiry",
                        R.drawable.dimg,"400"));
        itemManuses.add(
                new ItemManuview(
                        "Lorem Ipsum","Enquiry",
                        R.drawable.dimg,"500"));
        itemManuses.add(
                new ItemManuview(
                        "Lorem Ipsum","Enquiry",
                        R.drawable.dim1,"500"));
        itemManuses.add(
                new ItemManuview(
                        "Lorem Ipsum","Enquiry",
                        R.drawable.dim1,"600"));
        itemManuses.add(
                new ItemManuview(
                        "Lorem Ipsum","Enquiry",
                        R.drawable.dimg,"400"));
        itemManuses.add(
                new ItemManuview(
                        "Lorem Ipsum","Enquiry",
                        R.drawable.dimg,"500"));
        itemManuses.add(
                new ItemManuview(
                        "Lorem Ipsum","Enquiry",
                        R.drawable.dim1,"500"));
        itemManuses.add(
                new ItemManuview(
                        "Lorem Ipsum","Enquiry",
                        R.drawable.dim1,"600"));
        // recyclerView.setBackgroundColor();
        ProductAdapter adapter = new ProductAdapter(getApplication(), itemManus);
        recyclerView.setAdapter(adapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(getApplication(),
                LinearLayoutManager.HORIZONTAL, true));
        PagerSnapHelper snapHelper = new PagerSnapHelper();
        snapHelper.attachToRecyclerView(recyclerView);
        ////////////////////////////////////////
//        ProductAdapterview adapters = new ProductAdapterview(getApplication(), itemManuses);
//        recyclerViews.setAdapter(adapters);
//        recyclerViews.setLayoutManager(new LinearLayoutManager(getApplication(),
//                LinearLayoutManager.VERTICAL, true));
        RecyclerView.LayoutManager layoutManager = new GridLayoutManager(getApplication(),2);
        recyclerViews.setHasFixedSize(true);
        ProductAdapterview adapters = new ProductAdapterview(getApplication(),itemManuses);
        recyclerViews.setLayoutManager(layoutManager);
        recyclerViews.setAdapter(adapters);

        RecyclerView.LayoutManager mLayoutManagers = new GridLayoutManager(getApplication(), 2);
        recyclerViews.setLayoutManager(mLayoutManagers);

        recyclerViews.addItemDecoration(new GridSpacingItemDecoration(2, dpToPx(5), true));
        recyclerViews.setItemAnimator(new DefaultItemAnimator());
        ProductAdapterview adapterss = new ProductAdapterview(getApplication(), itemManuses);
        recyclerViews.setAdapter(adapterss);

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
        private List<ItemManuview> itemManusss;
        public ProductAdapterview(Context mCtx, List<ItemManuview> itemManusss) {
            this.mCtx = mCtx;
            this.itemManusss = itemManusss;
        }
        @Override
        public ProductAdapterview.ProductViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            LayoutInflater inflater = LayoutInflater.from(mCtx);
            View view = inflater.inflate(R.layout.item_viewws_items, null);
            return new ProductAdapterview.ProductViewHolder(view);
        }
        @Override
        public void onBindViewHolder(ProductAdapterview.ProductViewHolder holder, int position) {
            ItemManuview addsetget = itemManusss.get(position);
            holder.textId.setText(String.valueOf(addsetget.getItemNames()));
            holder.ic_tv.setText(addsetget.getItembuttosnames());
            holder.text_ids.setText(addsetget.getPrice());
            holder.imageItem.setImageDrawable(mCtx.getResources().getDrawable(addsetget.getImg()));

        }
        @Override
        public int getItemCount() {
            return itemManusss.size();
        }
        class ProductViewHolder extends RecyclerView.ViewHolder {
            TextView catid, textId,ic_tv,text_ids;
            ImageView imageItem;
            LinearLayout lv;
            public ProductViewHolder(View itemView) {
                super(itemView);
                catid = itemView.findViewById(R.id.catid);
                textId = itemView.findViewById(R.id.textId);
                imageItem = itemView.findViewById(R.id.imageItem);
                lv = itemView.findViewById(R.id.lv);
                ic_tv = itemView.findViewById(R.id.ic_tv);
                text_ids = itemView.findViewById(R.id.text_ids);
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
