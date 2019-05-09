# A tool to count the line number of C files in your specified directory
# 
#    usage: 
#            count [dirname]
#
#    author: flyer    Copyright 2019"
#             A useful count tool"
    
#!/bin/bash
function count
{
    for file in $(ls)
    do
        if [ -d $file ]  # get the lines of this dir file 
        then
            cd $file
            count
        else
            if echo $file|grep -Eq "\.c$|\.h$"
            then
                count=$( wc -l $file|awk '{print $1}' )
                sum=$(( $count + $sum ))           # count the lines
            fi
        fi
    done
    cd ..
    return
}

sum=0
if [ $# -eq 0 ]
then
    cd  $PWD
    echo "In path:$PWD"
    count
elif [ $# -eq 1 ]
then 
    cd $1
    echo "In path:$PWD"
    count
else
    echo  "usage: "
    echo  "        count [dirname]"
    echo  "author: flyer    Copyright 2019"
    echo  "         A useful count tool"
    exit
fi
echo "there are $sum lines C  in this directory"
