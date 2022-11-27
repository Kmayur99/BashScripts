

# bin/bash

#starting with script

#!/bin/bash





function funcName()
{
    echo "enter the choice"
    echo "1.Install the AWS CLI "
    echo "2.Check Version"
    echo "3.aws configure"
    echo "4.setting up ENV"
    echo "5.Create AWS Key-pair"
    echo "6.Describe Key pairs"
    echo "7.Delete Key-value pairs"
   
    read choice
    case "$choice" in

    1)  echo "Installing Docker------"
        curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
        unzip awscli-bundle.zip
        sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
        echo "installation done"
        funcName
        
        ;;
    2)  echo "AWS cli vERSION IS:"
        aws --version
        funcName
        
        ;;
    3)  echo "AWS configuration:"
        aws configure
        funcName
        
        ;;
     4)  echo "AWS configuration:"
        echo "Enter the set of env you want to export"
        echo "Enter in this format--- AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE"
        read formatstr
        str1="export"
        finalstr=$str1$formatstr
        $finalstr
        funcName
        ;;
        
     5)  echo "AWS Key-pair:"
        echo "Enter value of Key you want:"
        read awskey
        str="aws ec2 create-key-pair --key-name"
        str2="--query 'KeyMaterial' --output text > "
        str4=".pem"
        str3=$awskey$str4
        finalstring=$str$awskey$str2$str3
        $finalstring
        echo "Dont forgot to give the permission to your file"
        funcName
        ;;
    6)  echo "Describe key pair:"
        aws ec2 describe-key-pairs --key-name
        funcName
        ;;
    7)  echo "Delete Key pair:"
        echo "Enter the key you want to delete "
        read deletekey
        awscmmd="aws ec2 delete-key-pair --key-name"
        finalawscmd=$awscmmd$deletekey
        $finalawscmd
        funcName
        
        ;;

    *) echo "Signal number $1 is not processed"
       ;;
    esac
}
funcName
