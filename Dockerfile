FROM pandoc/latex:latest
RUN apk add --no-cache python3 git make
COPY requirements-freeze.txt /tmp/requirements-freeze.txt
RUN pip3 install -r /tmp/requirements-freeze.txt
RUN mkdir /build
RUN git clone https://github.com/databrary/policies.git /build/policies
RUN git clone -b rog1_2020-07-08 https://github.com/databrary/www.git /build/www
WORKDIR /build/policies
RUN git pull
WORKDIR /build/www
RUN git pull
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ARG GITHUB_TOKEN
ENV GITHUB_TOKEN $GITHUB_TOKEN
CMD /entrypoint.sh
