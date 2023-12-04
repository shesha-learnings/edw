#!/bin/bash

HOST=$host
PORT=$port
USER=$admin_user
PASSWORD=$admin_password
DATABASES=$databases
INSTANCE_DIR=$instance_dir
CHANGELOG_FILE="changelog-root.xml"
OUTPUT_LOCATION="S3 Location" # TODO for storing generated sql for review
DB_ENGINE="postgresql"
DRIVER="org.postgresql.Driver"

function execute_command(){
    cmd=$1
    extra_arg=$2
    output=$($CODEBUILD_SRC_DIR/install/liquibase --searchPath=${db_dir} --changeLogFile=${CHANGELOG_FILE} --driver=${DRIVER} --username=${USER} --password=${PASSWORD} --url=${URL} ${extra_arg} ${cmd})
    if [[ $? -ne 0 ]] ; then
        echo "Falied to execute liquibase ${cmd}"
        exit 1;
    fi
    echo ${output}
}

function parse(){
    if [ -n "$1" ]; then
        num_of_change=$(echo $1 | cut -d ' ' -f1)
        echo ${num_of_change}
    else
        echo "Input is empty."
        exit 1;
    fi
}

STAGE=`echo "$stage" | tr '[:upper:]' '[:lower:]'`
if [[ "${STAGE}" != "build" && "${STAGE}" != "deploy" ]]; then
    echo "Invalid Stage. Actual input: ${stage}. Allowed values: build/deploy."
    exit 1
fi

for db in ${DATABASES//,/ }
do
    echo "Start deploying ${db}"
    URL="jdbc:${DB_ENGINE}://${HOST}:${PORT}/${db}"
    db_dir="${CODEBUILD_SRC_DIR}/${INSTANCE_DIR}/${db}"

    output=$(execute_command "status")
    changes=$(parse ${output})
    
    if [[ ${#changes} -eq 1 && $changes -gt 0 ]]; then
        echo "${output}"
        
        execute_command "validate" ""
        
        output=$(execute_command "unexpected-changesets")
        changes=$(parse ${output})
        if [[ ${#changes} -eq 1 && $changes -gt 0 ]]; then
            echo "${output}"
            exit 1
        fi

        execute_command "update-sql" "--output-file sql_output.sql"
        cat sql_output.sql
        if [ "${STAGE}" == "build" ]; then
            echo "TODO Push files to S3 bucker for review."
            echo "Add S3 location on notification to approver."
        fi
        
        if [ "${STAGE}" == "deploy" ]; then
            #output=$(execute_command "update")
            echo "${output}"
        fi
    else
        echo "${output}"
    fi
    echo "Finish"
done

