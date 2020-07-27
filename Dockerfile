FROM pandoc/latex:latest
RUN apk add --no-cache python3 git make
RUN mkdir /build
RUN git clone https://github.com/databrary/policies.git /build/policies
RUN git clone -b rog1_2020-07-08 https://github.com/databrary/www.git /build/www
WORKDIR /build/policies
RUN make all
WORKDIR /build/www
RUN pip3 install -r requirements-freeze.txt
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
