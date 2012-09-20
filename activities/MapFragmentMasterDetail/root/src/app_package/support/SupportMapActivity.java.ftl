package ${packageName}.support;

import android.os.Build;
import android.os.Bundle;
import android.view.KeyEvent;

import ${packageName}.R;
import com.google.android.maps.MapActivity;
 
public class SupportMapActivity extends MapActivity {
    
    @Override
    protected void onCreate(Bundle icicle) {
        super.onCreate(icicle);
        setContentView(R.layout.fragment_map);
    }
    
    @Override
    protected boolean isRouteDisplayed() {
        return false;
    }
    
	@Override
	public boolean dispatchKeyEvent(KeyEvent event) {
		final int keyCode = event.getKeyCode();
		if (keyCode == KeyEvent.KEYCODE_MENU) {
			// massive hack workaround for LocalActivityManager map fragment
			if (Build.VERSION.SDK_INT >= 11) {
				final int action = event.getAction();
				if (action == KeyEvent.ACTION_UP) {
					getParent().openOptionsMenu();
					return true;
				}
			}
		}
		return super.dispatchKeyEvent(event);
	}
    
}
