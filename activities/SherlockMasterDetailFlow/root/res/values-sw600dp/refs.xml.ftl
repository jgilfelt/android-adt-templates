<resources>
    <!--
    Layout alias to replace the single-pane version of the layout with a
    two-pane version on screens with a smallest width (smallest dimension)
    of at least 600 density-independent pixels (dips).

    For more on layout aliases, see:
    http://developer.android.com/training/multiscreen/screensizes.html#TaskUseAliasFilters
    -->
    <item type="layout" name="activity_${collection_name}">@layout/activity_${objectKind?lower_case}_twopane</item>
</resources>
