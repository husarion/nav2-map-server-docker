ARG ROS_DISTRO=galactic

FROM husarnet/ros:$ROS_DISTRO-ros-core

SHELL ["/bin/bash", "-c"]

RUN apt update && apt upgrade -y && apt install -y \
        ros-$ROS_DISTRO-nav2-map-server && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo $(dpkg -s ros-$ROS_DISTRO-nav2-map-server | grep 'Version' | sed -r 's/Version:\s([0-9]+.[0-9]+.[0-9]+).*/\1/g') >> /version.txt

RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc