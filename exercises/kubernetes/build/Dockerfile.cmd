FROM ubuntu:bionic
ENV VAR_CMD ls
CMD ["sh", "-c", "${VAR_CMD}"]

