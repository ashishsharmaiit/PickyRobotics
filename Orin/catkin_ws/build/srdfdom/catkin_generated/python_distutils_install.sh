#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/orin/Orin/catkin_ws/src/srdfdom"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/orin/Orin/catkin_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/orin/Orin/catkin_ws/install/lib/python3/dist-packages:/home/orin/Orin/catkin_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/orin/Orin/catkin_ws/build" \
    "/usr/bin/python3" \
    "/home/orin/Orin/catkin_ws/src/srdfdom/setup.py" \
    egg_info --egg-base /home/orin/Orin/catkin_ws/build/srdfdom \
    build --build-base "/home/orin/Orin/catkin_ws/build/srdfdom" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/orin/Orin/catkin_ws/install" --install-scripts="/home/orin/Orin/catkin_ws/install/bin"
