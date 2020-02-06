#! /bin/bash
function help_f()
{
    echo "$0 will provide information based on location, extension including memory info"
    echo "$0 [-l location ][ --location location][-e extension][--extension extension][-s|--stats][-h|--help]"
    echo "Examples:"
    echo "$0 -l /etc"
    echo "$0 -l /etc -e txt -s"
    exit 1
}
LOCATION=$(pwd)
EXT=""
STATS=0
while [ $# != 0 ]
do
    case $1 in 
        -l|--location )
                    echo "-l|--location provided"
                    LOCATION=$2
                    if [ ! -d $LOCATION ]; then 
                       echo "You should provide valid directory as Location"
                       exit 2
                    fi                  
                    shift
                    shift
                    ;;
        -e|--extension )
                    echo "-e|--extension provided"
                    EXT=$2
                    echo "$EXT provided as argument"
                    shift
                    shift
                    ;;
         -s|--stats )
                 echo "-s|--stats provided"
                 STATS=1
                 shift
                 ;; 
         -h|--help )
                 help_f
                 shift
                 ;;
         * )
                 help_function
                 shift   
    esac
done
echo "Location:$LOCATION"
echo "Extension:$EXT"
ls -l $LOCATION | awk '/^-/' | grep ".$EXT" &> /dev/null
if [ $? -ne 0 ]; then
   echo "No Files with extension: $EXT found"
   exit 2
fi
ls -l $LOCATION | awk '/^-/' | grep ".$EXT" | awk 'BEGIN{sum=0}{sum=sum+$5}END{print "The Number of Files:" NR;print "The Total size of all Files:" sum " Bytes";print "The Total size of all Files:" sum/1024/1024 " MB"}'

# This will be exected if you provide -s or --stats option
if [ $STATS -ne 0 ]; then
    echo
    echo "Statistics are:"
    ls -l $LOCATION | awk '/^-/' | grep ".$EXT" | awk '{if(NR==1){max=$5;min=$5;max_file=$9;min_file=$9;}if($5>max){max=$5;max_file=$9;}if($5<min){min=$5;min_file=$9;}}END{print "The Largest File:" max_file "  Its Size:" max " Bytes";print "The Smallest File:" min_file "  Its Size:" min " Bytes"}'
fi





