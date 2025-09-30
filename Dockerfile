ARG version=0.65.0
FROM alpine AS download
ARG version

RUN wget https://github.com/fatedier/frp/releases/download/v${version}/frp_${version}_linux_amd64.tar.gz
RUN tar xzvf frp_${version}_linux_amd64.tar.gz

FROM scratch
ARG version
COPY --from=download frp_${version}_linux_amd64/frps /bin/frps
COPY --from=download frp_${version}_linux_amd64/LICENSE /LICENSE
ENTRYPOINT ["/bin/frps"]
