#!/bin/bash

#The next line specifies the path to the directory where the file would be created and used
path=/home/vagrant/memory_info/ram.log

#Next line formats the date string  to extract hour and minutes
midnight=$(date +%H%M)
#Recepient email
email=ogunleyedamola1995@yahoo.com
#next line of code is  a function used to create a file and also remove  an existing file
function createLogFile() {
         if test -f $path; then
                sudo rm -rf $path
         else
                 touch $path
                 date >> $path
                 echo "Below is your system's daily memory usage information displayed in Megabytes(MB) : " >> $path
                 free -m >> $path
         fi

}
#checks if it is midnight and executes the command
if [[ $midnight == 0000 ]]; then
         createLogFile
         echo "Hello Ogunlye! click and download the attachment file  containing information of your system memory usage : " | mail -s "DAILY SYSTEM MEMORY USAGE"  $email -A $path
fi

