img="nvidia/cudagl:10.1-devel-ubuntu16.04" 
top=`pwd`/..
nvidia-docker run --ipc=host --privileged -d  -v $top/:/autofdo  $img  tail -f /dev/null 
