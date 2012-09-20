package ${packageName};

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
<#if parentActivityClass != "">import android.support.v4.app.NavUtils;
import android.view.MenuItem;</#if>

public class ${CollectionName}Activity extends FragmentActivity implements ${CollectionName}Fragment.Callbacks {

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_${objectKind?lower_case});
	}
	<#if parentActivityClass != "">

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                // This ID represents the Home or Up button. In the case of this
                // activity, the Up button is shown. Use NavUtils to allow users
                // to navigate up one level in the application structure. For
                // more details, see the Navigation pattern on Android Design:
                //
                // http://developer.android.com/design/patterns/navigation.html#up-vs-back
                //
                NavUtils.navigateUpFromSameTask(this);
                return true;
        }
        return super.onOptionsItemSelected(item);
    }
    </#if>

	@Override
	public void onItemSelected(String id) {
		// Show the detail view in this activity by
		// adding or replacing the detail fragment using a
		// fragment transaction.
		Bundle arguments = new Bundle();
		arguments.putString(${DetailName}Fragment.ARG_ITEM_ID, id);
		${DetailName}Fragment fragment = new ${DetailName}Fragment();
		fragment.setArguments(arguments);
		getSupportFragmentManager().beginTransaction()
		    .replace(R.id.${detail_name}_container, fragment).commit();
	}

}
