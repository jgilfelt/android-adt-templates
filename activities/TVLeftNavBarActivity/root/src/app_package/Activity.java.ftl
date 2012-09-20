package ${packageName};

import com.example.google.tv.leftnavbar.LeftNavBar;
import com.example.google.tv.leftnavbar.LeftNavBarService;
import com.example.google.tv.leftnavbar.R;

import android.os.Bundle;
import android.app.ActionBar;
import android.app.Activity;
import android.app.FragmentTransaction;
import android.app.ActionBar.Tab;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

public class ${activityClass} extends Activity {

	private LeftNavBar mLeftNavBar;
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		(LeftNavBarService.instance()).getLeftNavBar((Activity) this);
		setContentView(R.layout.${layoutName});
		
		// prepare the left navigation bar
        setupBar();
	}
	
	<#include "include_onCreateOptionsMenu.java.ftl">
	
	private LeftNavBar getLeftNavBar() {
        if (mLeftNavBar == null) {
            mLeftNavBar = new LeftNavBar(this);
            mLeftNavBar.setOnClickHomeListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    // This is called when the app icon is selected in the left navigation bar
                }
            });
        }
        return mLeftNavBar;
    }
	
	private void flipOption(int option) {
        ActionBar bar = getLeftNavBar();
        int options = bar.getDisplayOptions();
        boolean hadOption = (options & option) != 0;
        bar.setDisplayOptions(hadOption ? 0 : option, option);
    }

	private void setupBar() {
		
        ActionBar bar = getLeftNavBar();
        bar.setBackgroundDrawable(getResources().getDrawable(R.drawable.leftnav_bar_background_dark));
        
        <#if barBehavior == "collapse">
        // behavior collapsed
        flipOption(LeftNavBar.DISPLAY_ALWAYS_EXPANDED);
        </#if>
        
        <#if barBehavior == "auto">
        // behavior auto-expand
        flipOption(LeftNavBar.DISPLAY_AUTO_EXPAND);
        </#if>
        
        <#if navType == "none">
        // no navigation
        bar.setNavigationMode(ActionBar.NAVIGATION_MODE_STANDARD);
        </#if>
        
        <#if navType == "tabs">
        // tabs navigation
        bar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);
        bar.removeAllTabs();
		bar.addTab(bar.newTab().setText(R.string.tab_a).setIcon(R.drawable.tab_a)
				.setTabListener(mTabListener), false);
		bar.addTab(bar.newTab().setText(R.string.tab_b).setIcon(R.drawable.tab_b)
				.setTabListener(mTabListener), false);
		bar.addTab(bar.newTab().setText(R.string.tab_c).setIcon(R.drawable.tab_c)
				.setTabListener(mTabListener), false);
		bar.addTab(bar.newTab().setText(R.string.tab_d).setIcon(R.drawable.tab_d)
				.setTabListener(mTabListener), false);
		</#if>

		<#if navType == "list">
        // list navigation
		bar.setNavigationMode(ActionBar.NAVIGATION_MODE_LIST);
        SpinnerListAdapter adapter = new SpinnerListAdapter(this);
        bar.setListNavigationCallbacks(adapter, new ActionBar.OnNavigationListener() {
            @Override
            public boolean onNavigationItemSelected(int itemPosition, long itemId) {
            	Toast.makeText(${activityClass}.this, "Item selected: " + itemPosition, Toast.LENGTH_SHORT).show();
                return true;
            }
        });
        </#if>
        
    }
	
	<#if navType == "tabs">
	private ActionBar.TabListener mTabListener = new ActionBar.TabListener() {
        @Override
        public void onTabSelected(Tab tab, FragmentTransaction ft) {
        	Toast.makeText(${activityClass}.this, "Tab selected: " + tab.getPosition(), Toast.LENGTH_SHORT).show();
        }

        @Override
        public void onTabUnselected(Tab tab, FragmentTransaction ft) {
        }

        @Override
        public void onTabReselected(Tab tab, FragmentTransaction ft) {	
        }
    };
    </#if>
    
    <#if navType == "list">
    private static final class SpinnerListAdapter extends BaseAdapter {

        private static final int[] NAMES = {
            R.string.list_a, R.string.list_b, R.string.list_c };
        private static final int[] PICTURES = {
            R.drawable.list_a, R.drawable.list_b, R.drawable.list_c };

        private final Context mContext;

        SpinnerListAdapter(Context context) {
            mContext = context;
        }

        @Override
        public int getCount() {
            return NAMES.length;
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public Object getItem(int position) {
            return null;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            return createView(position, convertView, parent, false);
        }

        @Override
        public View getDropDownView(int position, View convertView, ViewGroup parent) {
            return createView(position, convertView, parent, true);
        }

        private View createView(int position, View convertView, ViewGroup parent, boolean inList) {
            if (convertView == null) {
                convertView = LayoutInflater.from(mContext).inflate(
                        R.layout.spinner_item, parent, false);
            }
            ImageView picture = (ImageView) convertView.findViewById(R.id.picture);
            TextView name = (TextView) convertView.findViewById(R.id.name);
            picture.setImageResource(PICTURES[position]);
            if (inList) {
                picture.setBackgroundResource(R.drawable.spinner_list_item_background);
                name.setVisibility(View.VISIBLE);
                name.setText(NAMES[position]);
            } else {
                picture.setBackgroundResource(R.drawable.spinner_item_background);
                name.setVisibility(View.GONE);
            }
            return convertView;
        }
    }
    </#if>
	
}