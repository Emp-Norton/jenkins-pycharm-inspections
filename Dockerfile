FROM amazonlinux

RUN yum install tar which wget java -y
RUN mkdir -p /pycharm/results
RUN cd /pycharm && wget https://download.jetbrains.com/python/pycharm-community-2019.1.1.tar.gz
COPY ./customInspector.xml /pycharm/profiles/customInspector.xml
RUN tar -xzf /pycharm/pycharm-community-2019.1.1.tar.gz -C /pycharm

# Entry point is inspect.sh - params: /path-to-web/ pycharm_inspector /path-to-inspection-profile/ /output-directory/
# E.G: "docker run -v $WORKSPACE:/web pycharm_inspector /web /pycharm/profiles/customInspector.xml /web/build/docker/pycharm_inspector/results"
ENTRYPOINT ["bash", "/pycharm/pycharm-community-2019.1.1/bin/inspect.sh"]
