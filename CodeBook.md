Description on the script output format ("CodeBook")
====================================================

## Variables/features/fields

For consistency with the raw source data an effort is made to keep the name unaltered and with a prefix index number, to disambinguate data and to ease linking the data source afterward after downstream analysis.

You can refer to the original feature_info.txt document for the raw feature selection.

The script included normalize to lowercase and remove puntuation keeping a prefix index.

The script then retain only the "mean" and "std" column as requested performing also the requested aggregation by subject id and activity label (mean by subject and activity).

For example:

"15 tBodyAcc-min()-Z" becomes "x15tbodyaccminz"

"41 tGravityAcc-mean()-X" becomes "x41tgravityaccmeanx"

etc.

