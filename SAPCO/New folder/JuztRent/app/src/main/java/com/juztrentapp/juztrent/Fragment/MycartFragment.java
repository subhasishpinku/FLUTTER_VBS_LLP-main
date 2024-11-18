package com.juztrentapp.juztrent.Fragment;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.Bundle;
import android.util.Log;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.NumberPicker;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.cardview.widget.CardView;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.google.android.material.button.MaterialButton;
import com.juztrentapp.juztrent.PaymentmethodActivity;
import com.juztrentapp.juztrent.R;
import com.juztrentapp.juztrent.ViewCardDetails;
import com.juztrentapp.juztrent.ViewcardActvity;
import com.travijuu.numberpicker.library.Enums.ActionEnum;
import com.travijuu.numberpicker.library.Interface.ValueChangedListener;

import java.util.ArrayList;
import java.util.List;
public class MycartFragment extends Fragment {
    List<ViewCardDetails> viewCardDetails;
    RecyclerView recyclerView;
    MaterialButton btn_add;
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
        View rootView = inflater.inflate(R.layout.my_card_view, container, false);
        recyclerView = (RecyclerView)rootView.findViewById(R.id.recyclerView);
        btn_add  = (MaterialButton)rootView.findViewById(R.id.btn_add);
        btn_add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getContext(), PaymentmethodActivity.class);
                startActivity(intent);
            }
        });
        viewCardDetails = new ArrayList<>();
        viewCardDetails.add(
                new ViewCardDetails(
                        "Lorem Ipsum",
                        "Lorem Ipsum",
                        "8,0000",
                        R.drawable.order_history_product));

        viewCardDetails.add(
                new ViewCardDetails(
                        "Lorem Ipsum",
                        "Lorem Ipsum",
                        "8,0000",
                        R.drawable.order_history_product));
        viewCardDetails.add(
                new ViewCardDetails(
                        "Lorem Ipsum",
                        "Lorem Ipsum",
                        "8,0000",
                        R.drawable.order_history_product));
        recyclerView.addItemDecoration(new GridSpacingItemDecoration(4, dpToPx(5), true));
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        ProductAdapter adapter = new ProductAdapter(getContext(), viewCardDetails);
        recyclerView.setAdapter(adapter);
        return rootView;
    }
    public class ProductAdapter extends RecyclerView.Adapter<ProductAdapter.ProductViewHolder> {
        private Context mCtx;
        List<ViewCardDetails> viewCardDetails;
        public ProductAdapter(Context mCtx, List<ViewCardDetails> viewCardDetails) {
            this.mCtx = mCtx;
            this.viewCardDetails = viewCardDetails;
        }
        @Override
        public ProductViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            LayoutInflater inflater = LayoutInflater.from(mCtx);
            View view = inflater.inflate(R.layout.layout_products, null);
            return new ProductViewHolder(view);
        }
        @Override
        public void onBindViewHolder(ProductViewHolder holder, int position) {
            //getting the product of the specified position
            ViewCardDetails product = viewCardDetails.get(position);
            //binding the data with the viewholder views
            holder.textViewTitle.setText(product.getItemNames());
            holder.textViewShortDesc.setText(product.getItemSNames());
            holder.textViewPrice.setText(String.valueOf(product.getItemAmount()));
            holder.imageView.setImageDrawable(mCtx.getResources().getDrawable(product.getImg()));
            holder.cd_ID.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    System.out.println("GETTEXT"+holder.display.getText().toString());
                }
            });

            holder.number_picker.setValueChangedListener(new ValueChangedListener() {
                @Override
                public void valueChanged(int value, ActionEnum action) {
                    Log.e("numberp", "old value" + value + "' " + "new val" + action + ", ");

                }
            });

//            holder.number_picker.setMax(15);
//            holder.number_picker.setMin(5);
//            holder.number_picker.setUnit(2);
//            holder.number_picker.setValue(10);
//            holder.increment.setOnClickListener(new View.OnClickListener() {
//                @Override
//                public void onClick(View v) {
//                    System.out.println("GETTEXT"+holder.display.getText().toString());
//
//                }
//            });
//            holder.decrement.setOnClickListener(new View.OnClickListener() {
//                @Override
//                public void onClick(View v) {
//                    System.out.println("GETTEXT"+holder.display.getText().toString());
//
//                }
//            });
//            NumberPicker numberPicker = (NumberPicker) findViewById(R.id.number_picker);
//            holder.number_picker.setMax(15);
//            holder.number_picker.setMin(5);
//            holder.number_picker.setUnit(2);
            // holder.number_picker.setValue(10);
        }
        @Override
        public int getItemCount() {
            return viewCardDetails.size();
        }
        class ProductViewHolder extends RecyclerView.ViewHolder {
            TextView textViewTitle, textViewShortDesc, textViewRating, textViewPrice;
            ImageView imageView;
            Button increment,decrement;
            EditText display;
            CardView cd_ID;
            com.travijuu.numberpicker.library.NumberPicker number_picker;
            public ProductViewHolder(View itemView) {
                super(itemView);
                textViewTitle = itemView.findViewById(R.id.textViewTitle);
                textViewShortDesc = itemView.findViewById(R.id.textViewShortDesc);
                textViewPrice = itemView.findViewById(R.id.textViewPrice);
                imageView = itemView.findViewById(R.id.imageView);
                increment = itemView.findViewById(R.id.increment);
                decrement = itemView.findViewById(R.id.decrement);
                display = itemView.findViewById(R.id.display);
                cd_ID = itemView.findViewById(R.id.cd_ID);
                number_picker = itemView.findViewById(R.id.number_picker);
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

