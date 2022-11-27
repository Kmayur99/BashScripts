# bin/bash

#starting with script

#!/bin/bash





function funcName()
{
    echo "enter the choice"
    echo "1.Install the Docker"
    echo "2.Login and Start the Docker Service"
    echo "3.Check the images"
    echo "4.search for the images"
    echo "5.run the container"
    echo "6.user based command"
    echo "7.docker cheatsheet"
    echo "8.check the version of docker"
    echo "9.Delete deligate images"
    echo "10.delete the particular image and container"
    read choice
    case "$choice" in

    1)  echo "Installing Docker------"
        brew  install docker
        echo "installation done"
        funcName
        
        ;;
    2)  echo  "Docker Service Starting"
        docker login
        service docker start
        funcName
        
        ;;
    3)  echo  "check the images and containers resides locally"
        docker images ls
        docker ps
        echo "want to see stoped containers /comment yes and no"
        read ans
        if [ $ans == "yes" ];then
            docker ps -a
        else
            echo "ok"
        fi
        funcName
        
        ;;
    4) echo  " Enter the image to Search"
        read str
        string1="docker search"
        string3=$string1$str
        $string3
        funcName
       
       ;;
    6) echo  "Enter the command you wanrt to execute"
        read command1
        $command1
        funcName
       ;;
    7) echo  "docker helper"
        docker help
        funcName
        ;;
    8) echo  "Docker Version is:"
        docker --version
        funcName
       ;;
    9) echo  "pruning the dangling images"
        docker image prune
        funcName
       ;;
    10) echo  "delete the image and container"
        echo "enter the image id you want to delete"
        read imgid
        string1="docker image rm"
        string3=$string1$imgid
        $string3
        echo "enter the container id you want to delete"
        read conid
        strin="docker container rm"
        delecon=$strin$conid
        $delecon
        funcName
       ;;
    *) echo "Signal number $1 is not processed"
       ;;
    esac
}
funcName
