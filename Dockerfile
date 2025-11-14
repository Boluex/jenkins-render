FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

# Jenkins must listen on Render's assigned port
ENV JENKINS_OPTS="--httpPort=$PORT"

EXPOSE 8080 50000

USER jenkins

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]





















# FROM jenkins/jenkins:lts

# USER root


# RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*


# EXPOSE 8080 50000


# ENV JENKINS_OPTS="--httpPort=${PORT:-8080}"

# USER jenkins

# ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
