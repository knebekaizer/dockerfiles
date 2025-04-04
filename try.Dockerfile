FROM devel

# COPY docker_login /etc
# RUN sudo chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]

# CMD /bin/bash --rcfile /etc/docker_login -i
CMD DOCKER_RUNNING=try bash
