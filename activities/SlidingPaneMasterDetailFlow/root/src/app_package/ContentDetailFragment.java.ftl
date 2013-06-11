package ${packageName};

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import ${packageName}.dummy.DummyContent;

/**
 * A fragment representing a single ${objectKind} detail screen.
 */
public class ${DetailName}Fragment extends Fragment {
	/**
	 * The fragment argument representing the item ID that this fragment
	 * represents.
	 */
	public static final String ARG_ITEM_ID = "item_id";

	/**
	 * The dummy content this fragment is presenting.
	 */
	private DummyContent.DummyItem mItem;

	private View mRootView;

	/**
	 * Mandatory empty constructor for the fragment manager to instantiate the
	 * fragment (e.g. upon screen orientation changes).
	 */
	public ${DetailName}Fragment() {
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setHasOptionsMenu(true);
	}

	@Override
	public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
		inflater.inflate(R.menu.detail, menu);
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		mRootView = inflater.inflate(R.layout.fragment_${detail_name},
				container, false);

		// Show the dummy content as text in a TextView.
		if (mItem != null) {
			((TextView) mRootView.findViewById(R.id.${detail_name}))
					.setText(mItem.content+" ......... "+mItem.content+" ......... "+mItem.content);
		}

		return mRootView;
	}

	public void setText(String text){
		((TextView) mRootView.findViewById(R.id.${detail_name}))
		.setText(text+" ......... "+text+" ......... "+text);
		getActivity().getActionBar().setTitle(text);
	}
}
