#Create 5 files and 5 directories
touch FILE1 file2 FIle3 fiLE4 filE5 
mkdir -p dir1 Dir2 dIr3 DIR4 dir5  
#For each directory creates 5 files and 5 subdirectories
for d in */ ; do
cd $d
touch SUBFILE1 subfile2 SUbFIle3 sUBfiLE4 subfilE5
mkdir -p SUBdir1 subdir2 SUbdIr3 sUBDIR4 subdir5
cd -
done
#For each subdirectory creates 5 files and 5 directories
for i in **/*/ ; do
cd $i
touch SUB2FILE1 sub2file2 SUb2FIle3 sUB2fiLE4 sub2filE5
mkdir -p SUB2dir1 sub2dir2 SUb2dIr3 sUB2DIR4 sub2dir5 
cd -
done
