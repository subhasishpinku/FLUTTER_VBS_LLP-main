package com.juztrentapp.juztrent;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.button.MaterialButton;

import java.util.ArrayList;
import java.util.List;

public class PaymentmethodActivity extends AppCompatActivity {
    List<PaymentmethodSetget> paymentmethodSetgets;
    RecyclerView recyclerView;
    MaterialButton btn_add;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.payment_activity);
        recyclerView = (RecyclerView)findViewById(R.id.recyclerView);
        btn_add = (MaterialButton)findViewById(R.id.btn_add);
        btn_add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(),PaymentStatus.class);
                startActivity(intent);
            }
        });
        paymentmethodSetgets = new ArrayList<>();
        paymentmethodSetgets.add(
                new PaymentmethodSetget(
                        "12345678901234",
                        R.drawable.visa_icon));
        paymentmethodSetgets.add(
                new PaymentmethodSetget(
                        "12345678901234",
                        R.drawable.master_card));
        paymentmethodSetgets.add(
                new PaymentmethodSetget(
                        "12345678901234",
                        R.drawable.gpay));
        paymentmethodSetgets.add(
                new PaymentmethodSetget(
                        "12345678901234",
                        R.drawable.rupay_icon));
        paymentmethodSetgets.add(
                new PaymentmethodSetget(
                        "12345678901234",
                        R.drawable.cash));
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        Paymentmethod adapter = new Paymentmethod(this, paymentmethodSetgets);
        recyclerView.setAdapter(adapter);
    }

    public class Paymentmethod extends RecyclerView.Adapter<Paymentmethod.ProductViewHolder> {
        private Context mCtx;
        private List<PaymentmethodSetget> paymentmethodSetgets;
        public Paymentmethod(Context mCtx, List<PaymentmethodSetget> paymentmethodSetgets) {
            this.mCtx = mCtx;
            this.paymentmethodSetgets = paymentmethodSetgets;
        }
        @Override
        public ProductViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            //inflating and returning our view holder
            LayoutInflater inflater = LayoutInflater.from(mCtx);
            View view = inflater.inflate(R.layout.payment_method, null);
            return new ProductViewHolder(view);
        }
        @Override
        public void onBindViewHolder(ProductViewHolder holder, int position) {
            //getting the product of the specified position
            PaymentmethodSetget product = paymentmethodSetgets.get(position);
            //binding the data with the viewholder views
            holder.textViewShortDesc.setText(product.getItemNames());
            holder.imageView.setImageDrawable(mCtx.getResources().getDrawable(product.getImg()));
        }
        @Override
        public int getItemCount() {
            return paymentmethodSetgets.size();
        }
        class ProductViewHolder extends RecyclerView.ViewHolder {
            TextView textViewTitle, textViewShortDesc, textViewRating, textViewPrice;
            ImageView imageView;
            public ProductViewHolder(View itemView) {
                super(itemView);
                textViewShortDesc = itemView.findViewById(R.id.textViewShortDesc);
                imageView = itemView.findViewById(R.id.imageView);
            }
        }
    }
}
