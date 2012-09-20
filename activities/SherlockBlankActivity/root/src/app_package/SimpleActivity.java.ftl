package ${packageName};

import com.actionbarsherlock.app.SherlockActivity;

import android.os.Bundle;
import com.actionbarsherlock.view.Menu;
<#if parentActivityClass != "">
import com.actionbarsherlock.view.MenuItem;
import android.support.v4.app.NavUtils;
</#if>

public class ${activityClass} extends SherlockActivity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});
        <#if parentActivityClass != "">
        // Show the Up button in the action bar.
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        </#if>
    }

    <#include "include_onCreateOptionsMenu.java.ftl">
    <#include "include_onOptionsItemSelected.java.ftl">

}
