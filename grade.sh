CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

# Download new test files
rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

# Check if ListExamples.java exists
if [[ -f "student-submission/ListExamples.java" ]];
then
    echo "All Files are present"
else
    echo "Some Files may be missing"
    exit 0
fi


# Run tests
scp TestListExamples.java student-submission
cd student-submission
mkdir lib
cd ..
scp lib/hamcrest-core-1.3.jar student-submission/lib
scp lib/junit-4.13.2.jar student-submission/lib
cd student-submission

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples