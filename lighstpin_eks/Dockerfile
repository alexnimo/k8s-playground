FROM ubuntu:latest

RUN apt update && apt -y upgrade
RUN apt install -y python3 python3-pip git
USER 12300:12300

RUN cd ~
RUN git clone https://github.com/lightspin-tech/eks-creation-engine.git && cd eks-creation-engine
ENTRYPOINT [ "python3 main.py" ]