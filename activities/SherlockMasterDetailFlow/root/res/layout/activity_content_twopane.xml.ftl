<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:layout_marginLeft="16dp"
    android:layout_marginRight="16dp"
    android:divider="?android:attr/dividerHorizontal"
    android:orientation="horizontal"
    android:showDividers="middle"
    tools:context=".${CollectionName}Activity">

    <!--
    This layout is a two-pane layout for the ${objectKindPlural}
    master/detail flow. See res/values-large/refs.xml and
    res/values-sw600dp/refs.xml for an example of layout aliases
    that replace the single-pane version of the layout with
    this two-pane version.

    For more on layout aliases, see:
    http://developer.android.com/training/multiscreen/screensizes.html#TaskUseAliasFilters
    -->

    <fragment
        android:id="@+id/${collection_name}"
        android:name="${packageName}.${CollectionName}Fragment"
        android:layout_width="0dp"
        android:layout_height="match_parent"
        android:layout_weight="1"
        tools:layout="@android:layout/list_content" />

    <FrameLayout
        android:id="@+id/${detail_name}_container"
        android:layout_width="0dp"
        android:layout_height="match_parent"
        android:layout_weight="3" />

</LinearLayout>
