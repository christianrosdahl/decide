% TEST Performs unit testing of the decide function
% and its related functions.

addpath('tests')
addpath('conditions')

testObject = TestingClass;
testResults = run(testObject);