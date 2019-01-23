S=0
while read LINE
do
 var1=`echo $LINE | cut -f1 -d"="`
 echo $var1
 if [[ $1 == $LINE ]]
then
 $S=1
fi


done < /etc/rc.conf| grep -Ev '#'
echo "S=$S"
echo "$0 === $1"
