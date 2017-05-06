#!/bin/bash
#employee management system - Karan Nagpal (F3_9914103085)

#functions
Display()
{
	choice2=1
	while [ $choice2 != "15" -a $choice2 -gt "0" -a $choice2 -le "15" ]
	do
		clear
		echo "1. Display details of all employees"
		echo "2. Display details of employees of a particular department"
		echo "3. Display details of employees whose salary is between A & B"
		echo "4. Display details of employees joined after a particular date" #not working
		echo "5. Display details of all male employees"
		echo "6. Display details of all female employees"
		echo "7. Display details of all employees of a particular designation"
		echo "8. Display details of all Interns"
		echo "9. Display maximum salary offered to an employee with corresponding details"
		echo "10. Display average salary of all employees"
		echo "11. Sort employee details in decreasing order of salary"
		echo "12. Sort employee details in increasing order of salary"
		echo "13. Search employee by name"
		echo "14. Display salary & Net salary of all employees"
		echo "15. Back"
		echo -e "Your Choice : \c"
		read choice2
		case $choice2 in
		1)	clear
			awk 'BEGIN{ 
				printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n"
				printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n" 
				printf "-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n" } 
				{print;}' Database | column -t;
		    printf "\nEnter any key to go back..."; 
		    read a;;
		2)  clear
			printf "Enter Department : "
			read dept
			(printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n";
			printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n"; 
			grep $dept Database) | column -t;
		    printf "\nEnter any key to go back..."; 
		    read a;;
		3)	clear
			printf "Enter starting salary : "
			read ssal
			printf "Enter end salary : "
			read esal
			(printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n";
			printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			awk -v min=$ssal -v max=$esal '{if($8<=max && $8>=mini) {print $0}}' Database) | column -t;
		    printf "\nEnter any key to go back..."; 
		    read a;;
		4)	clear
			printf "Enter Date (DD MMM YYYY) : "
			read date_join
			join=$(date -d "$date_join" +%Y%m%d)
			(printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n";
			printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			awk -v joining=$join 'BEGIN{check=0} {check=system("echo "$10" | awk -F"-" OFS=" " {print $1,$2,$3}")} {if(check>joining) {print $0}}' Database) | column -t;
		    printf "\nEnter any key to go back..."; 
		    read a;;
		5)	clear
			(printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n";
			printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n"; 
			grep -w "M" Database) | column -t;
		    printf "\nEnter any key to go back..."; 
		    read a;;
		6)	clear
			(printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n";
			printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			grep -w "F" Database) | column -t;
		    printf "\nEnter any key to go back..."; 
		    read a;;
		7)	clear
			printf "Enter Designation : "
			read desn
			(printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n";
			printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			grep $desn Database) | column -t;
		    printf "\nEnter any key to go back..."; 
		    read a;;
		8)	clear
			(printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n";
			printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			grep "Intern" Database) | column -t;
		    printf "\nEnter any key to go back..."; 
		    read a;;
		9)	clear
			(printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n";
			printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			max=$(sort -nrk8 Database | head -1 | cut -f8);
			awk -v maxi=$max '{if($8==maxi) {print $0}}' Database) | column -t;
		    printf "\nEnter any key to go back..."; 
		    read a;;
		10)	clear
			(printf "\n--------------\n";
			printf "Average_Salary\n";
			printf "\n--------------\n";
			awk 'BEGIN{count=0} {count=count+$8} END{print count/NR}' Database) | column -t;
		    printf "\nEnter any key to go back..."; 
		    read a;;
		11)	clear
			(printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n";
			printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			sort -nrk8 Database) | column -t;
		    printf "\nEnter any key to go back..."; 
		    read a;;
		12)	clear
			(printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n";
			printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			sort -nk8 Database) | column -t;
		    printf "\nEnter any key to go back..."; 
		    read a;;
		13)	clear
			printf "Enter First_Name : "
			read fname
			printf "Enter Last_Name : "
			read lname
			(printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n";
			printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
			awk -v f=$fname -v l=$lname '{if($2==f && $3==l) {print}}' Database) | column -t;
		    printf "\nEnter any key to go back..."; 
		    read a;;    
		14)	clear
			(printf "\n-------------\t----------\t---------\t------\t----------\n";
			printf "Emp_ID\tFirst_Name\tLast_Name\tSalary\tNet_Salary\n";
			printf "\n-------------\t----------\t---------\t------\t----------\n";
			awk '{print $1,$2,$3,$8,$8*0.70}' Database) | column -t;
		    printf "\nEnter any key to go back..."; 
		    read a;;    
		15) return;;
		*) echo "Invalid Entry! Script will exit now";;
		esac
	done
}

Edit()
{
	choice3=1
	while [ $choice3 != "4" -a $choice3 -gt "0" -a $choice3 -le "4" ]
	do
		clear
		echo "1. Add details of an employee"
		echo "2. Delete details of an employee"
		echo "3. Modify details of an employee"
		echo "4. Back"
		echo -e "Your Choice : \c"
		read choice3
		case $choice3 in
		1) Add_emp;;
		2) Delete_emp;;
		3) Modify_emp;;
		4) return;;
		*) echo "Invalid Entry! Script will exit now";;
		esac
	done
}

About()
{
	clear
	printf "The project deals with a database for the employees of any organisation. It has features like add,delete and modify employee details and searching of the records can be done by various methods like according to salary, designation etc...\n\nThe project uses the following commands to accomplish the given task : \n\n"
	printf "1. grep\n2. sed\n1. awk\n3. expr\n4. read\n5. sort\n6. echo\n7. printf\n8. sort\n9. while\n10. switch case\n11. clear"
	printf "\n12. if conditions\n13. tput"
	printf "\n\n\nEnter any key to go back..."; 
	read a
}

Exitmessage()
{
	clear
	echo_c "Good Bye ${username^^}" 
	printf "\n"
	echo_c "Program will terminate in       "
	printf "\033[6D"
	sec=5
	while [ $sec -ge 0 ]
	do
		printf "$sec secs\033[6D"
		#printf "Program will terminate in $sec\033[K\r"
		 sleep 1
		 sec=`expr $sec - 1`
		# : $((sec--))
	done
	tput clear
	exit
	#kill -9 $PPID

}


Add_emp()
{
	clear
	printf "Fill in the following form : "
	printf "\nEmp_ID : "
	read emp
	printf "First_Name : "
	read first
	printf "Last_Name : "
	read lastn
	printf "Address : "
	read ad
	printf "Date_Of_Birth : "
	read dob
	printf "Sex : "
	read sex
	printf "Department : "
	read dept
	printf "Salary : "
	read sal
	printf "Designation : "
	read des
	printf "Joining_Date : "
	read joining
	data=$(echo -n -e "$emp\t$first\t$lastn\t$ad\t$dob\t$sex\t$dept\t$sal\t$des\t$joining")
	sed -i '$ a\'"$data" Database
	printf "\nRecord successfully added."; 
	printf "\nEnter any key to go back..."; 
	read a
}

Delete_emp()
{
	clear
	printf "Enter Emp_ID of the of the employee whose record is to be deleted : "
	read del
	sed -i "/$del/d" Database
	printf "\nRecord successfully deleted."; 
	printf "\nEnter any key to go back..."; 
	read a
}

Modify_emp()
{
	clear
	printf "Enter Emp_ID of the employee whose record has to be modified : "
	read mod
	printf "\nOld details : ";
	
	(printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n";
	printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n";
	printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n"; 
	sed -n "/$mod/p" Database) | column -t;
		    
	old=$(sed -n "/$mod/p" Database)
	printf "\nEnter new details : "; 
	
	printf "\nEmp_ID : "
	read emp
	printf "First_Name : "
	read first
	printf "Last_Name : "
	read lastn
	printf "Address : "
	read ad
	printf "Date_Of_Birth : "
	read dob
	printf "Sex : "
	read sex
	printf "Department : "
	read dept
	printf "Salary : "
	read sal
	printf "Designation : "
	read des
	printf "Joining_Date : "
	read joining
	data=$(echo -n -e "$emp\t$first\t$lastn\t$ad\t$dob\t$sex\t$dept\t$sal\t$des\t$joining")
	
	sed -i "s/$old/$data/" Database
	printf "\nRecord successfully modified."; 
	printf "\nEnter any key to go back..."; 
	read a
}

echo_c()
{
  w=$(stty size | cut -d" " -f2)       # width of the terminal
  l=${#1}                              # length of the string
  printf "%"$((l+(w-l)/2))"s" "$1"   # print string padded to proper width (%Ws)
}



#start of script
clear
printf "\n\n\n\n\n\n\n\n\n"
welmsg="WELCOME TO UNITY's Management System"
#len=`expr "$welmsg" : ".*"`

echo_c "$welmsg"
printf "\n\n\n\n"

COLS=$(tput cols)
ROWS=$(tput lines)
CENTERCOL=$(expr $COLS / 2)
CENTERROW=$(expr $ROWS / 2)
CENTERROW=$(expr $CENTERROW - 8)
CENTERCOL=$(expr $CENTERCOL - 10)
tput cup $CENTERROW $CENTERCOL
printf "Username : "
read username

CENTERROW=$(expr $CENTERROW + 1)
tput cup $CENTERROW $CENTERCOL
printf "Password : "
read -s password
printf "\n\n"

grep -wq $username accounts
if [ $? -eq 0 ]
then
	check=$(grep -w $username accounts | cut -f2)
	if [ $password = $check ]
	then
		clear
		echo_c "Welcome ${username^^}"
		printf "\n"
		echo_c "Press any key to continue..."
		read a
		choice=1
		while [ $choice != "4" -a $choice -gt "0" -a $choice -le "4" ]
		do
			clear
			echo "1. Display Employee Details"
			echo "2. Edit Employee Details"
			echo "3. About"
			echo "4. Exit"
			echo -e "Your Choice : \c"
			read choice
			case $choice in
			1) Display;;
			2) Edit;;
			3) About;;
			4) Exitmessage;;
			*)  
				msg="Invalid Entry! Script will exit now"
				printf "\n"
				echo_c "$msg"
				printf "\n" 
			;;
			esac
		done	
	else
		printf "\n"
		echo_c "Invalid Username or Password! Script will exit now."	
		printf "\n"
	fi
else
	printf "\n"
	echo_c "Invalid Username or Password! Script will exit now."
	printf "\n"
fi
