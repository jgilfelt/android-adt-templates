package ${packageName}.support;

import ${packageName}.R;
import com.google.android.maps.MapView;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TabHost;
import android.widget.TabHost.TabSpec;

public class SupportMapFragment extends LocalActivityManagerFragment {
    
    private TabHost mTabHost;
    private MapView mMapView;
    
	@Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {        
        View view = inflater.inflate(R.layout.support_map_fragment, container, false);
        mTabHost = (TabHost)view.findViewById(android.R.id.tabhost);
        mTabHost.setup(getLocalActivityManager());
        
        TabSpec tab = mTabHost.newTabSpec("map")
                              .setIndicator("map")
                              .setContent(new Intent(getActivity(), SupportMapActivity.class));
        mTabHost.addTab(tab);        
        return view;
    }
    
    @SuppressWarnings("deprecation")
	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		mMapView = (MapView) getLocalActivityManager().getCurrentActivity().findViewById(R.id.mapview);
    }
    
    public MapView getMapView() {
		return mMapView;
	}
    
}
