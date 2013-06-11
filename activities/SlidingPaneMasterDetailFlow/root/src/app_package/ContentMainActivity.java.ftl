package ${packageName};



import ${packageName}.dummy.DummyContent;

import android.annotation.SuppressLint;
import android.app.ActionBar;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.widget.SlidingPaneLayout;
import android.view.Menu;

import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.Toast;
import android.view.MenuItem;

/**
 * An activity representing the represents a a list of ${objectKindPlural} and
 * its details in a Sliding Pane.
 * <p>
 * The activity makes heavy use of fragments. The list of items is a
 * {@link ${CollectionName}Fragment} and the item details
 * (if present) is a {@link ${DetailName}Fragment}.
 * <p>
 * This activity also implements the required
 * {@link ${CollectionName}Fragment.Callbacks} interface
 * to listen for item selections.
 */
public class MainActivity extends FragmentActivity implements
		${CollectionName}Fragment.Callbacks {

	private SlidingPaneLayout mSlidingLayout;
	private ActionBar mActionBar;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		// List items should be given the
		// 'activated' state when touched.
		((${CollectionName}Fragment) getSupportFragmentManager().findFragmentById(
				R.id.${collection_name})).setActivateOnItemClick(true);

		mActionBar = getActionBar();

		mSlidingLayout = (SlidingPaneLayout) findViewById(R.id.sliding_pane_layout);

		mSlidingLayout.setPanelSlideListener(new SliderListener());
		mSlidingLayout.openPane();

		mSlidingLayout.getViewTreeObserver().addOnGlobalLayoutListener(
				new FirstLayoutListener());

		// TODO: If exposing deep links into your app, handle intents here.
	}

	 /**
     * Callback method from {@link ${CollectionName}Fragment.Callbacks}
     * indicating that the item with the given ID was selected.
     */
	@Override
	public void onItemSelected(String id) {

			// Show the detail view in this activity by
			// adding or replacing the detail fragment using a
			// fragment transaction.

			((${DetailName}Fragment)getSupportFragmentManager().findFragmentById(R.id.content_pane))
					.setText(DummyContent.ITEM_MAP.get(id).content);


			mSlidingLayout.closePane();

	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		/*
		 * The action bar up action should open the slider if it is currently
		 * closed, as the left pane contains content one level up in the
		 * navigation hierarchy.
		 */
		if (item.getItemId() == android.R.id.home && !mSlidingLayout.isOpen()) {
			mSlidingLayout.openPane();
			return true;
		}
		return super.onOptionsItemSelected(item);
	}

	/**
	 * This panel slide listener updates the action bar accordingly for each
	 * panel state.
	 */
	private class SliderListener extends
			SlidingPaneLayout.SimplePanelSlideListener {
		@Override
		public void onPanelOpened(View panel) {
			Toast.makeText(panel.getContext(), "Opened", Toast.LENGTH_SHORT)
					.show();

			panelOpened();
		}

		@Override
		public void onPanelClosed(View panel) {
			Toast.makeText(panel.getContext(), "Closed", Toast.LENGTH_SHORT)
					.show();

			panelClosed();
		}

		@Override
		public void onPanelSlide(View view, float v) {
		}
	}

	private void panelClosed() {
		mActionBar.setDisplayHomeAsUpEnabled(true);
		mActionBar.setHomeButtonEnabled(true);

		getSupportFragmentManager().findFragmentById(R.id.content_pane)
				.setHasOptionsMenu(true);
		getSupportFragmentManager().findFragmentById(R.id.${collection_name})
				.setHasOptionsMenu(false);

	}

	private void panelOpened() {
		mActionBar.setHomeButtonEnabled(false);
		mActionBar.setDisplayHomeAsUpEnabled(false);

		if (mSlidingLayout.isSlideable()) {
			getSupportFragmentManager().findFragmentById(R.id.content_pane)
					.setHasOptionsMenu(false);
			getSupportFragmentManager().findFragmentById(R.id.${collection_name})
					.setHasOptionsMenu(true);
		} else {
			getSupportFragmentManager().findFragmentById(R.id.content_pane)
					.setHasOptionsMenu(true);
			getSupportFragmentManager().findFragmentById(R.id.${collection_name})
					.setHasOptionsMenu(false);
		}
	}

	/**
	 * This global layout listener is used to fire an event after first layout
	 * occurs and then it is removed. This gives us a chance to configure parts
	 * of the UI that adapt based on available space after they have had the
	 * opportunity to measure and layout.
	 */
	@SuppressLint("NewApi")
	private class FirstLayoutListener implements
			ViewTreeObserver.OnGlobalLayoutListener {
		@Override
		public void onGlobalLayout() {

			if (mSlidingLayout.isSlideable() && !mSlidingLayout.isOpen()) {
				panelClosed();
			} else {
				panelOpened();
			}
			if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
				mSlidingLayout.getViewTreeObserver()
						.removeOnGlobalLayoutListener(this);
			} else {
				mSlidingLayout.getViewTreeObserver()
						.removeGlobalOnLayoutListener(this);
			}
		}
	}
}
