#! /bin/bash

read -p "Enter first Number :" n1
read -p "Enter Second Number :" n2
echo ""
echo "1 --> Addition Operation"
echo "2 --> Subtraction Operation"
echo "3 --> Multiplication Operation"
echo "4 --> Division Operation"
read -p "Choose the option 1|2|3|4: " option

case $option in 
	1)
		echo "$n1+$n2=$((n1+n2))"
		;;
	2)
		echo "$n1-$n2=$((n1-n2))"
		;;
	3)
		echo "$n1*$n2=$((n1*n2))"
		;;
	4)
		echo "$n1/$n2=$((n1/n2))"
		;;
	*)
		echo "Enter 1|2|3|4 Option Only. Execute Again"
esac
