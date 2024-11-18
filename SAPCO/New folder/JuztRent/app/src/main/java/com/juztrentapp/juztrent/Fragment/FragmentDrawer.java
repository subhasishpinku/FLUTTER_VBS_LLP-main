package com.juztrentapp.juztrent.Fragment;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.widget.Toolbar;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.fragment.app.Fragment;
import com.juztrentapp.juztrent.Consts;
import com.juztrentapp.juztrent.R;
public class FragmentDrawer extends Fragment {
    private static String TAG = FragmentDrawer.class.getSimpleName();
    private ActionBarDrawerToggle mDrawerToggle;
    private DrawerLayout mDrawerLayout;
    private View containerView;
    private SharedPreferences sp;
    private FragmentDrawerListener drawerListener;
    private TextView tv_home,tv_order_history,tv_terms_conditions,tv_privacy_policy,tv_order_status,tv_my_card,tv_payment_method;
    public FragmentDrawer() {
    }
    @Override
    public void setUserVisibleHint(boolean isVisibleToUser) {
        super.setUserVisibleHint(isVisibleToUser);
        if (isVisibleToUser) {
            Log.e("TABB","00");
            getFragmentManager().beginTransaction().detach(this).attach(this).commit();
        }
    }
    public void setDrawerListener(FragmentDrawerListener listener) {
        this.drawerListener = listener;
        Log.e("MANU","2");
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        sp  =   this.getActivity().getSharedPreferences(Consts.SP_NAME, Context.MODE_PRIVATE);
        View layout = inflater.inflate(R.layout.fragment_navigation_drawer, container, false);
        tv_home = (TextView)layout.findViewById(R.id.tv_home);
        tv_order_history = (TextView)layout.findViewById(R.id.tv_order_history);
        tv_terms_conditions = (TextView)layout.findViewById(R.id.tv_terms_conditions);
        tv_privacy_policy = (TextView)layout.findViewById(R.id.tv_privacy_policy);
        tv_order_status = (TextView)layout.findViewById(R.id.tv_order_status);
        tv_my_card = (TextView)layout.findViewById(R.id.tv_my_card);
        tv_payment_method = (TextView)layout.findViewById(R.id.tv_payment_method);
        tv_home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerListener.onDrawerItemSelected(view, Consts.DASBOARD);
                mDrawerLayout.closeDrawer(containerView);
            }
        });
        tv_order_history.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerListener.onDrawerItemSelected(view, Consts.ORDERHISTORY);
                mDrawerLayout.closeDrawer(containerView);
            }
        });
        tv_terms_conditions.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerListener.onDrawerItemSelected(view, Consts.TRANSANDCONDITION);
                mDrawerLayout.closeDrawer(containerView);
            }
        });
        tv_privacy_policy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerListener.onDrawerItemSelected(view, Consts.PRIVACYPOLICY);
                mDrawerLayout.closeDrawer(containerView);
            }
        });
        tv_order_status.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerListener.onDrawerItemSelected(view, Consts.ORDERSTATUS);
                mDrawerLayout.closeDrawer(containerView);
            }
        });
        tv_my_card.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerListener.onDrawerItemSelected(view, Consts.MYCART);
                mDrawerLayout.closeDrawer(containerView);
            }
        });
        tv_payment_method.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerListener.onDrawerItemSelected(view, Consts.PAYMENTMETHOD);
                mDrawerLayout.closeDrawer(containerView);
            }
        });
        return layout;
    }
    public void setUp(int fragmentId, DrawerLayout drawerLayout, final Toolbar toolbar) {
        Log.e("MANU","00");
        toolbar.setNavigationIcon(R.drawable.ic_baseline_dashboard_24);
        containerView = getActivity().findViewById(fragmentId);
        mDrawerLayout = drawerLayout;
        mDrawerToggle = new ActionBarDrawerToggle(getActivity(), drawerLayout, toolbar, R.string.drawer_open, R.string.drawer_close) {
            @Override
            public void onDrawerOpened(View drawerView) {
                super.onDrawerOpened(drawerView);
                getActivity().invalidateOptionsMenu();
                Log.e("MANU","0");
            }
            @Override
            public void onDrawerClosed(View drawerView) {
                super.onDrawerClosed(drawerView);
                getActivity().invalidateOptionsMenu();
                Log.e("MANU","1");
            }
            @Override
            public void onDrawerSlide(View drawerView, float slideOffset) {
                super.onDrawerSlide(drawerView, slideOffset);
                toolbar.setAlpha(1 - slideOffset / 1);
                Log.e("MANU","2");
                toolbar.setCollapseIcon(R.drawable.ic_baseline_dashboard_24);

            }
        };
        mDrawerLayout.setDrawerListener(mDrawerToggle);
        mDrawerLayout.post(new Runnable() {
            @Override
            public void run() {
                mDrawerToggle.syncState();
            }
        });
    }
    public interface FragmentDrawerListener {
        public void onDrawerItemSelected(View view, int position);
    }
}

