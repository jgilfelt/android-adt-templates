<android.support.v4.widget.SlidingPaneLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:id="@+id/sliding_pane_layout"
    android:layout_width="match_parent"
    android:layout_height="match_parent" >

    <!--
         The first child view becomes the left pane. When the combined
         desired width (expressed using android:layout_width) would
         not fit on-screen at once, the right pane is permitted to
         overlap the left.
    -->

    <fragment
        android:id="@+id/${collection_name}"
        android:name="${packageName}.${CollectionName}Fragment"
        android:layout_width="280dp"
        android:layout_height="match_parent"
        android:layout_gravity="left" />

    <!--
         The second child becomes the right (content) pane. In this
         example, android:layout_weight is used to express that this
         pane should grow to consume leftover available space when the
         window is wide enough. This allows the content pane to
         responsively grow in width on larger screens while still
         requiring at least the minimum width expressed by
         android:layout_width.
    -->

    <fragment
        android:id="@+id/content_pane"
        android:name="${packageName}.${DetailName}Fragment"
        android:layout_width="450dp"
        android:layout_height="match_parent"
        android:layout_weight="1"
        android:paddingLeft="16dp"
        android:paddingRight="16dp" />

</android.support.v4.widget.SlidingPaneLayout>
