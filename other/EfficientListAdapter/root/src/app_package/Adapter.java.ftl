package ${packageName};

<#if isSectioned == true>
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
</#if>
import java.util.List;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
<#if isSectioned == true>
import android.widget.SectionIndexer;
</#if>
import android.widget.TextView;

import ${packageName}.dummy.Dummy${objectKind}Content;
import ${packageName}.dummy.Dummy${objectKind}Content.DummyItem;

<#if isSectioned != true>
public class ${objectKind}Adapter extends BaseAdapter {
</#if>
<#if isSectioned == true>
public class ${objectKind}Adapter extends BaseAdapter implements SectionIndexer {
</#if>
    
	// TODO replace with a collection of real data
	private static final List<DummyItem> DATA = Dummy${objectKind}Content.ITEMS;
	
	private LayoutInflater mInflater;
    
    <#if isSectioned == true>
    private HashMap<String, Integer> mAlphaIndexer;
    private String[] mSections;
    </#if>
    
    public ${objectKind}Adapter(Context context) {
        // Cache the LayoutInflate to avoid asking for a new one each time.
        mInflater = LayoutInflater.from(context);
        
        <#if isSectioned == true>
        setupSections(); 
        </#if> 
    }

    <#if isSectioned == true>
	private void setupSections() {
		mAlphaIndexer = new HashMap<String, Integer>();
		int size = getCount();
		for (int i = size - 1; i >= 0; i--) {
			
			// TODO reference the data member you want to index on
			String element = DATA.get(i).content;
			
			if (element == null) element = "0";
			String c;
			try {
				Integer.valueOf(element.substring(0, 1));
				c = "#";
			} catch (NumberFormatException e) {
				c = element.toUpperCase().substring(0, 1);
			}
			mAlphaIndexer.put(c, i);
		}

		Set<String> keys = mAlphaIndexer.keySet();
		Iterator<String> it = keys.iterator();
		ArrayList<String> keyList = new ArrayList<String>();
		while (it.hasNext()) {
			String key = it.next();
			keyList.add(key);
		}
		Collections.sort(keyList);
		mSections = new String[keyList.size()];
		keyList.toArray(mSections);
	}
	</#if> 

    /**
     * @see android.widget.ListAdapter#getCount()
     */
    public int getCount() {
        return DATA.size();
    }

    /**
     * @see android.widget.ListAdapter#getItem(int)
     */
    public Object getItem(int position) {
        return DATA.get(position);
    }

    /**
     * Use the array index as a unique id.
     *
     * @see android.widget.ListAdapter#getItemId(int)
     */
    public long getItemId(int position) {
        return position;
    }

    /**
     * Make a view to hold each row.
     *
     * @see android.widget.ListAdapter#getView(int, android.view.View,
     *      android.view.ViewGroup)
     */
    public View getView(int position, View convertView, ViewGroup parent) {
        // A ViewHolder keeps references to children views to avoid unneccessary calls
        // to findViewById() on each row.
        ViewHolder holder;

        // When convertView is not null, we can reuse it directly, there is no need
        // to reinflate it. We only inflate a new View when the convertView supplied
        // by ListView is null.
        if (convertView == null) {
            convertView = mInflater.inflate(R.layout.list_item_${objectKind?lower_case}, parent, false);

            // Creates a ViewHolder and store references to the two children views
            // we want to bind data to.
            holder = new ViewHolder();
            // TODO store references to your views
            holder.title = (TextView) convertView.findViewById(R.id.title);
            holder.subtitle = (TextView) convertView.findViewById(R.id.subtitle);
            holder.thumbnail = (ImageView) convertView.findViewById(R.id.thumbnail);

            convertView.setTag(holder);
        } else {
            // Get the ViewHolder back to get fast access to the TextView
            // and the ImageView.
            holder = (ViewHolder) convertView.getTag();
        }

        // TODO Bind your data efficiently with the holder.
        holder.title.setText(DATA.get(position).content);
        holder.subtitle.setText(DATA.get(position).content);
        holder.thumbnail.setImageResource(DATA.get(position).thumbnail);

        return convertView;
    }

    static class ViewHolder {
    	// TODO define members for each view in the item layout
        TextView title;
        TextView subtitle;
        ImageView thumbnail;
    }
    
    <#if isSectioned == true>
	@Override
	public int getPositionForSection(int section) {
		String letter = mSections[section];
		return mAlphaIndexer.get(letter);
	}

	@Override
	public int getSectionForPosition(int position) {
		return 0;
	}

	@Override
	public Object[] getSections() {
		return mSections;
	}
	</#if> 
}
