#!/bin/sh

# gender.sh

URL=https://www3.nd.edu/~pbui/teaching/cse.20289.sp17/static/csv/demographics.csv

count_gender() {
    column=$((2*($1-2013)+1))
    gender=$2
    curl -s $URL | cut -d , -f $column | grep $gender | wc -l
}

for year in $(seq 2013 2019); do
    echo $year $(count_gender $year F) $(count_gender $year M)
done
