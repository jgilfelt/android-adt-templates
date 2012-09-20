<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="horizontal"
    tools:context=".${CollectionName}Activity" >
    
    <fragment
        android:id="@+id/${collection_name}"
        android:name="${packageName}.${CollectionName}Fragment"
        android:layout_width="0dp"
        android:layout_height="match_parent"
        android:layout_weight="1"
        tools:layout="@layout/fragment_map" />

    <FrameLayout
        android:id="@+id/${detail_name}_container"
        android:layout_width="0dp"
        android:layout_height="match_parent"
        android:layout_weight="0.5" />

</LinearLayout>
