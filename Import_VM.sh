#!/bin/bash
dir="/media/v/86FCF054FCF03FCB/VM/" #Directory where are VMs

find $dir -type f -name "*.vbox" -ls | awk '{$1=$2=$3=$4=$5=$6=$7=$8=$9=$10=""; print $0}' > list_VMs.txt

echo "#!/bin/bash" > test.txt
chmod u+x test.txt
#for i in $(read -r list_VMs.txt)
#do
#echo -n " VBoxManage registervm " >> test.txt
#echo  $i >> test.txt
#done

file="list_VMs.txt"

while read -r line; do
	echo -n " VBoxManage registervm " >> test.txt
    echo "$line" >> test.txt
done <$file 

./test.txt

rm test.txt list_VMs.txt
