CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -f 'ListExamples.java' ]]
then
    echo 'File Found'
else
    echo 'No file'
    exit
fi

cp ../TestListExamples.java TestListExamples.java

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java 2>compErr.txt

if [[ $? != 0 ]]
then
    echo 'Compliation error'
    cat compErr.txt
    exit
fi
echo 'Compiled'

java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples >testErr.txt

if [[ $? != 0 ]]
then
    echo 'Failed tests'
    cat testErr.txt
    exit
fi

echo 'Passed'
