!/bin/bash
#Deregister AMI's in a time frame and delete the associated Snapshots.

REGION=us-east-2
clear
date +%r
echo
echo "Getting Snapshot details of Region: $REGION"
echo

aws ec2 describe-snapshots --owner-ids self --query "Snapshots[?(StartTime<='2022-06-24')].[SnapshotId]" | grep snap > snapshot.txt 
sed 's/"//g' snapshot.txt | tr -d " \t" > snapshot-new.txt

echo

while read line
do
echo "Deleting " $line
echo
aws ec2 delete-snapshot --region $REGION --snapshot-id $line
done < snapshot-new.txt
echo
echo "Exitting in 5 Sec:" 
echo
i=5;while [ $i -gt 0 ];do if [ $i -gt 9 ];then printf "\b\b$i";else  printf "\b\b $i";fi;sleep 1;i=`expr $i - 1`;done
echo
exit