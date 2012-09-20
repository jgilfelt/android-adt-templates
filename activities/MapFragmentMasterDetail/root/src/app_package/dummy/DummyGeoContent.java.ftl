package ${packageName}.dummy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Helper class for providing sample content for user interfaces created by
 * Android template wizards.
 * <p>
 * TODO: Replace all uses of this class before publishing your app.
 */
public class DummyGeoContent {

    /**
     * An array of sample (dummy) items.
     */
    public static List<DummyItem> ITEMS = new ArrayList<DummyItem>();

    /**
     * A map of sample (dummy) items, by ID.
     */
    public static Map<String, DummyItem> ITEM_MAP = new HashMap<String, DummyItem>();

    static {
        // Add 3 sample items.
        addItem(new DummyItem("1", "${objectKind} 1", (int)(51.5174723*1E6),(int)(-0.0899537*1E6)));
        addItem(new DummyItem("2", "${objectKind} 2", (int)(51.515259*1E6),(int)(-0.086623*1E6)));
        addItem(new DummyItem("3", "${objectKind} 3", (int)(51.51738*1E6),(int)(-0.08186*1E6)));
    }

    private static void addItem(DummyItem item) {
        ITEMS.add(item);
        ITEM_MAP.put(item.id, item);
    }

    /**
     * A dummy item representing a piece of content.
     */
    public static class DummyItem {
		public String id;
		public String title;
		public int lat;
		public int lon;

		public DummyItem(String id, String title, int lat, int lon) {
			this.id = id;
			this.title = title;
			this.lat = lat;
			this.lon = lon;
		}

		@Override
		public String toString() {
			return title;
		}
	}
}
