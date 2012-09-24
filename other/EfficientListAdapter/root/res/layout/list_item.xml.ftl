<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:minHeight="?android:attr/listPreferredItemHeight" >

    <TextView
        android:id="@+id/title"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_marginLeft="8dip"
        android:layout_marginTop="8dip"
        android:layout_toRightOf="@+id/thumbnail"
        android:textAppearance="?android:attr/textAppearance" />

    <TextView
        android:id="@+id/subtitle"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_alignLeft="@+id/title"
        android:layout_below="@+id/title"
        android:textAppearance="?android:attr/textAppearanceSmall" />

    <ImageView
        android:id="@+id/thumbnail"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_alignParentLeft="true"
        android:layout_centerVertical="true"
        android:src="@drawable/ic_contact_picture_2" />

</RelativeLayout>