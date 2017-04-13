# Dockerfile for Monodevelop 6.3.0.863 docker image

run with:

 docker run -ti --name "monodev" --user $(id -u) --privileged=true --env="DISPLAY=$DISPLAY" -v /opt/work/volumes/monodev/home:/home/$USER -v /opt/work/volumes/monodev/tmp:/tmp -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro -v /etc/sudoers.d:/etc/sudoers.d:ro -v /tmp/.X11-unix:/tmp/.X11-unix:rw k4z3/monodevelop