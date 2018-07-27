#!/bin/bash

dir=$(ls -l rootfs |awk '/^d/ {print $NF}')
function getdir(){
    #echo LINENO $1
    cd $1
    for file in ./*
    do
        if ( [ "$file"x != "./X11"x ] && [ "$file"x != "./lib"x ] \
            && [ "$file"x != "./include"x ] && [ "$file"x != "./src"x ] \
            && [ "$file"x != "./doc"x ] && [ "$file"x != "./gvfs"x ] ); then
            if test -d "$file"
            then
                #echo 1111 $file $(pwd) 
                getdir $file
                #echo 2222 $(pwd)
                #ls
                #file_attr=`ls -ahl | awk '{print $3}' | grep -v root`
                file_attr=`ls -ahl | grep ^...s`
                if [ "$file_attr"x != ""x ]; then
                    echo $(pwd) 
                    echo ${file_attr}
                fi
                cd ..
            #else
                #temp_file=`basename $file`
                #echo $file

            fi
        fi
    done
}
getdir rootfs
