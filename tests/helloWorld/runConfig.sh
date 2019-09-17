#!/bin/sh

TEST_ROOT=$PWD
TASKLIB=$TEST_ROOT/src
WORKING_DIR=$TEST_ROOT/job_1
INPUT_FILE_DIRECTORIES=$TEST_ROOT/data
COMMAND_LINE="python $TASKLIB/hello.py $INPUT_FILE_DIRECTORIES/hello.txt"
JOB_QUEUE=LowMemBatchCloudformationJobqueue

# local only variables
#
DOCKER_CONTAINER=genepattern/docker-aws-python37



# batch only variables 
#
JOB_DEFINITION_NAME="Python37_Generic"
JOB_ID=gp_job_python37_$1

