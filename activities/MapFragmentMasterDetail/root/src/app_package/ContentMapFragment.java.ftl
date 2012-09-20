package ${packageName};

import java.util.List;

import android.app.Activity;
import android.graphics.drawable.Drawable;
import android.os.Bundle;

import ${packageName}.dummy.DummyGeoContent;
import ${packageName}.dummy.DummyGeoContent.DummyItem;
import ${packageName}.support.SupportMapFragment;
import com.google.android.maps.GeoPoint;
import com.google.android.maps.MapController;
import com.google.android.maps.MapView;
import com.google.android.maps.Overlay;
import com.google.android.maps.OverlayItem;

public class ${CollectionName}Fragment extends SupportMapFragment {

	/**
	 * The fragment's current callback object, which is notified of list item
	 * clicks.
	 */
	private Callbacks mCallbacks = sDummyCallbacks;
	
	/**
	 * A callback interface that all activities containing this fragment must
	 * implement. This mechanism allows activities to be notified of item
	 * selections.
	 */
	public interface Callbacks {
		/**
		 * Callback for when an item has been selected.
		 */
		public void onItemSelected(String id);
	}

	/**
	 * A dummy implementation of the {@link Callbacks} interface that does
	 * nothing. Used only when this fragment is not attached to an activity.
	 */
	private static Callbacks sDummyCallbacks = new Callbacks() {
		@Override
		public void onItemSelected(String id) {
		}
	};
	
	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		
		MapView mapView = getMapView();
		mapView.setBuiltInZoomControls(true);
		List<Overlay> mapOverlays = mapView.getOverlays();

		Drawable drawable = getResources().getDrawable(R.drawable.map_marker);
		${objectKind}ItemizedOverlay itemizedOverlay = new ${objectKind}ItemizedOverlay(drawable) {
			@Override
			protected boolean onTap(int index) {
				// Notify the active callbacks interface (the activity, if the
				// fragment is attached to one) that an item has been selected.
				mCallbacks.onItemSelected(DummyGeoContent.ITEMS.get(index).id);
				return true;
			}
		};
		
		// TODO populate your overlays
		GeoPoint point = null;
		for (DummyItem place : DummyGeoContent.ITEMS) {
			point = new GeoPoint(place.lat, place.lon);
			OverlayItem overlayItem = new OverlayItem(point, place.title, null);
			itemizedOverlay.addOverlay(overlayItem);
		}

		mapOverlays.add(itemizedOverlay);
		
		final MapController mc = mapView.getController();
		mc.animateTo(point);
		mc.setZoom(16);
		
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);

		// Activities containing this fragment must implement its callbacks.
		if (!(activity instanceof Callbacks)) {
			throw new IllegalStateException(
					"Activity must implement fragment's callbacks.");
		}

		mCallbacks = (Callbacks) activity;
	}

	@Override
	public void onDetach() {
		super.onDetach();

		// Reset the active callbacks interface to the dummy implementation.
		mCallbacks = sDummyCallbacks;
	}
	
}
