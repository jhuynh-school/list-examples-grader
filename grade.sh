CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

if [[ -f "student-submission/ListExamples.java" ]];
then
    echo "All Files are present"
else
    echo "Some Files may be missing"
    exit 0
fi

scp TestListExamples.java student-submission
cd student-submission
mkdir lib
cd ..
scp lib/hamcrest-core-1.3.jar student-submission/lib
scp lib/junit-4.13.2.jar student-submission/lib
cd student-submission

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples