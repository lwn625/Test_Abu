
keyword_match=cdp

row_for_cdp=1
col_for_mincdp=4
col_for_maxcdp=6

datain=../../../work/Zakum_Pre/Data_folder/Hydro/Study_PreStk_line_4.su

#Set a variable to the output of a command,
#This variable can be used in other commands
#Be careful: min_cdp=`command output` not min_cdp='command output'

#The idea：
#1. extract the row containing the required data by using grep
#   Here we find the row by matching the string cdp
#   It shows two matching rows: cdp and cdpt
#2. exclude the row of cdpt by using head, take the first row
#3. delete the sepecial characters ( and ) separately using sed
#4. extract the required data using awk
#   mind the passing variable should be defined again inside awk
 
min_cdp=`surange < $datain | \
grep $keyword_match | \
head -$row_for_cdp | \
sed 's/(//' | \
sed 's/)//' | \
awk -v var=$col_for_mincdp '{print $var}'`
echo $min_cdp
