l=0 
u=0
recl=0
recup=0
rsublow=0
rsubup=0

#This loop evaluates the first argument and if it is equal to -l||--lowercase or -u||--uppercase activates the variable to do the
#chosen function, if it is -r|--recursive will evaluate if is with or without -s|--suvdirectories, once this values are determined
#the while stops and we continue to the second part of the program, the implementation of the alogritm to lowercase or uppercase the files
#or subdirectories

while [ ! -z $1 ];do  
   file="$1"
   if [ $# -eq 0 ];then
      echo 'Syntax error, to see the proper use of the command please type: chname [-h|--help] '
      exit 1
 
   elif [[ $file == "-r" ]] || [[ $file == "--recursive" ]];then 
      shift
      file="$1"
      if [[ $file == "-s" ]] || [[ $file == "--subdirectories" ]];then
         shift
         file="$1"
         if [[ $file == "-l" ]] || [[ $file == "--lowercase" ]];then
            rsublow=1
            break
         elif [[ $file == "-u" ]] || [[ $file == "--uppercase" ]];then
            rsubup=1
            break
         fi
      elif [[ $file == "-l" ]] || [[ $file == "--lowercase" ]];then
         recl=1
         break
      elif [[ $file == "-u" ]]|| [[ $file == "--uppercase" ]];then
         recup=1
         break
      fi
   
   elif [[ $file == "-l" ]] || [[ $file == "--lowercase" ]];then
      l=1
      break
     
   elif [[ $file == "-u" ]] || [[ $file == "--uppercase" ]];then
      u=1
      break
        
   elif [[ $file == "-h" ]] || [[ $file == "--help" ]];then
      echo 'This command change the name of files  '
      echo '-l|--lowercase  converts to lowercase letters '
      echo '   Just for files this command does not works with directories ' 
      echo 'example chname -l FILE1 FILE2 -- file1 file2'
      echo ''     
      echo '-u|--uppercase  converts to uppercase letters  '
      echo '   Just for files this command does not works with directories ' 
      echo 'example chname -l file1 file2 -- FILE1 FILE2'
      echo '' 
      echo '-r|--recursive  change name to all of the files contained in a directory  '
      echo '   Just for files this command does not works with directories ' 
      echo '   For directories inclution -s|--subdirectories can be added' 
      echo 'example chname -r -l FILE1 DIR1 -- file1 DIR1'
      echo 'example chname -r -s -l FILE1 DIR1 -- file1 Dir1'  
      echo '' 
      break
         
   else 
      echo 'Syntax error, to see the proper use of the command please type: chname [-h|--help] '
   fi
    
    shift
done

#For each file, the program will run according to the previous selection until there are no more arguments
#If the name already exists, it will remain the same, otherwise it will be in lowercase or uppercase
#and then replace the existing name with the modified variable made. 

shift
while [ ! -z $1 ];do 
   file="$1"
   subfile="$1"
   if [ $l -eq 1 ];then #lowercase
      if [ -d $file ];then #lowerizing the directory
         lowercase=$(echo $file | tr '[A-Z]' '[a-z]'])
         if [ -d $lowercase ];then
               echo $file ' --remains with the same name'
         else
            /bin/mv $file $lowercase
            echo $file ' --renamed as' $lowercase
         fi
      elif [ -f $file ];then #lowerizing the file
         lowercase=$(echo $file | tr '[A-Z]' '[a-z]'])
         if [ -f $lowercase ];then
               echo $file ' --remains with the same name'
         else
            /bin/mv $file $lowercase
            echo $file ' --renamed as' $lowercase
         fi 
      else
         echo $file ' --this file or directory does not exist'
      fi #end lowercase
   
   elif [ $u -eq 1 ];then #uppercase
      if [ -d $file ];then #uppercasing the directory
         uppercase=$(echo $file | tr '[a-z]' '[A-Z]'])
         if [ -d $uppercase ];then
               echo $file ' --keepswith the same name'
         else
            /bin/mv $file $uppercase
            echo $file ' --renamed as' $uppercase
         fi 
      elif [ -f $file ];then #uppercasing the file
         uppercase=$(echo $file | tr '[a-z]' '[A-Z]'])
         if [ -f $uppercase ];then
               echo $file ' --remains with the same name'
         else
            /bin/mv $file $uppercase
            echo $file ' --renamed as' $uppercase
         fi 
      else
         echo $file ' --this file or directory does not exist'
      fi #end uppercase
   
   elif [ $recl -eq 1 ];then #recursive lowercase
      if [ -f $file ];then
         lowercase=$(echo $file | tr '[A-Z]' '[a-z]'])
         if [ -f $lowercase ];then
               echo $file ' --remains with the same name'
         else
            /bin/mv $file $lowercase
            echo $file ' --renamed as' $lowercase
         fi 
      elif [ -d $file ];then
         cd $file
         for f in *;do
            if [ -f $f ];then
               lowercase=$(echo $f | tr '[A-Z]' '[a-z]'])
               if [ -f $lowercase ];then
                  echo $f ' --remains with the same name'
               else
                  /bin/mv $f $lowercase
                  echo $f ' --renamed as' $lowercase
               fi 
            elif [ -d $f ];then
               lowercase=$(echo $f | tr '[A-Z]' '[a-z]'])
               if [ -d $lowercase ];then
                  echo $f ' --remains with the same name'
               else
                  /bin/mv $f $lowercase
                  echo $f ' --renamed as' $lowercase
               fi 
            fi
         done
         cd -
      else
         echo $file ' --this file or directory does not exist'
      fi #end recursive lowercase
      
    
   elif [ $recup -eq 1 ];then #recursive uppercase
      if [ -f $file ];then
         uppercase=$(echo $file | tr '[a-z]' '[A-Z]'])
         if [ -f $uppercase ];then
            echo $file ' --remains with the same name'
         else
            /bin/mv $file $uppercase
            echo $file ' --renamed as' $uppercase
         fi 
      elif [ -d $file ];then
         cd $file
         for f in *;do
            if [ -f $f ];then
               uppercase=$(echo $f | tr '[a-z]' '[A-Z]'])
               if [ -f $uppercase ];then
                  echo $f ' --remains with the same name'
               else
                  /bin/mv $f $uppercase
                  echo $f ' --renamed as' $uppercase
               fi 
            elif [ -d $f ];then
               uppercase=$(echo $f | tr '[a-z]' '[A-Z]'])
               if [ -d $uppercase ];then
                  echo $f ' --remains with the same name'
               else
                  /bin/mv $f $uppercase
                  echo $f ' --renamed as' $uppercase
               fi 
            fi
         done
         cd -
      else
         echo $file ' --this file or directory does not exist'
      fi #end recursive uppercase
      
      
   elif [ $rsublow -eq 1 ];then #recursive subdirectory lowercase
      if [ -f $file ];then
         lowercase=$(echo $file | tr '[A-Z]' '[a-z]'])
         if [ -f $lowercase ];then
               echo $file ' --remains with the same name'
         else
            /bin/mv $file $lowercase
            echo $file ' --renamed as' $lowercase
         fi 
      elif [ -d $file ];then
         cd $file
         for f in *;do
            if [ -f $f ];then
               lowercase=$(echo $f | tr '[A-Z]' '[a-z]'])
               if [ -f $lowercase ];then
                  echo $f ' --remains with the same name'
               else
                  /bin/mv $f $lowercase
                  echo $f ' --renamed as' $lowercase
               fi 
            elif [ -d $f ];then
               cd $f
		for i in *;do
		    if [ -f $i ];then
		       lowercase=$(echo $i | tr '[A-Z]' '[a-z]'])
		       if [ -f $lowercase ];then
		          echo $i ' --remains with the same name'
		       else
		          /bin/mv $i $lowercase
		          echo $i ' --renamed as' $lowercase
		       fi 
		    elif [ -d $i ];then
		       lowercase=$(echo $i | tr '[A-Z]' '[a-z]'])
		       if [ -d $lowercase ];then
		          echo $i ' --remains with the same name'
		       else
		          /bin/mv $i $lowercase
		          echo $i ' --renamed as' $lowercase
		       fi 
		    fi
		 done
	        cd -
            fi
         done
         cd -
      else
         echo $file ' --this file or directory does not exist'
      fi #end recursive subdirectory lowercase
   
   elif [ $rsubup -eq 1 ];then #recursive subdirectory uppercase
      if [ -f $file ];then
         uppercase=$(echo $file | tr '[a-z]' '[A-Z]'])
         if [ -f $uppercase ];then
               echo $file ' --remains with the same name'
         else
            /bin/mv $file $uppercase
            echo $file ' --renamed as' $uppercase
         fi 
      elif [ -d $file ];then
         cd $file
         for f in *;do
            if [ -f $f ];then
               uppercase=$(echo $f | tr '[a-z]' '[A-Z]'])
               if [ -f $uppercase ];then
                  echo $f ' --remains with the same name'
               else
                  /bin/mv $f $uppercase
                  echo $f ' --renamed as' $uppercase
               fi 
            elif [ -d $f ];then
               cd $f
		for i in *;do
		    if [ -f $i ];then
		       uppercase=$(echo $i | tr '[a-z]' '[A-Z]'])
		       if [ -f $uppercase ];then
		          echo $i ' --remains with the same name'
		       else
		          /bin/mv $i $uppercase
		          echo $i ' --renamed as' $uppercase
		       fi 
		    elif [ -d $i ];then
		       uppercase=$(echo $i | tr '[a-z]' '[A-Z]'])
		       if [ -d $uppercase ];then
		          echo $i ' --remains with the same name'
		       else
		          /bin/mv $i $uppercase
		          echo $i ' --renamed as' $uppercase
		       fi 
		    fi
		 done
	        cd -
            fi
         done
         cd -
      else
         echo $file ' --this file or directory does not exist'
      fi #end recursive subdirectory uppercase
        
   else
   echo 'error' 
   
   fi
        
shift
done


