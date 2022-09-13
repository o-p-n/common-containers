FROM scratch

ARG TARGETARCH
ARG TARGETOS
ARG TARGETVARIANT

# busybox @ 1.34.1
COPY --from=busybox@sha256:3614ca5eacf0a3a1bcc361c939202a974b4902b9334ff36eb29ffe9011aaad83 /bin/busybox /bin/busybox

RUN [ "/bin/busybox", "ln", "-f", "/bin/busybox", "/bin/sh"]
RUN cd /bin \
  && busybox ln -f busybox addgroup \
  && busybox ln -f busybox adduser \
  && busybox ln -f busybox awk \
  && busybox ln -f busybox basename \
  && busybox ln -f busybox cat \
  && busybox ln -f busybox chgrp \
  && busybox ln -f busybox chmod \
  && busybox ln -f busybox chown \
  && busybox ln -f busybox cmp \
  && busybox ln -f busybox cp \
  && busybox ln -f busybox date \
  && busybox ln -f busybox delgroup \
  && busybox ln -f busybox deluser \
  && busybox ln -f busybox dirname \
  && busybox ln -f busybox df \
  && busybox ln -f busybox du \
  && busybox ln -f busybox echo \
  && busybox ln -f busybox false \
  && busybox ln -f busybox find \
  && busybox ln -f busybox getopt \
  && busybox ln -f busybox grep \
  && busybox ln -f busybox head \
  && busybox ln -f busybox kill \
  && busybox ln -f busybox killall \
  && busybox ln -f busybox less \
  && busybox ln -f busybox ln \
  && busybox ln -f busybox ls \
  && busybox ln -f busybox mkdir \
  && busybox ln -f busybox mktemp \
  && busybox ln -f busybox more \
  && busybox ln -f busybox mv \
  && busybox ln -f busybox nc \
  && busybox ln -f busybox netstat \
  && busybox ln -f busybox nslookup \
  && busybox ln -f busybox ping \
  && busybox ln -f busybox pwd \
  && busybox ln -f busybox realpath \
  && busybox ln -f busybox rm \
  && busybox ln -f busybox sed \
  && busybox ln -f busybox seq \
  && busybox ln -f busybox sh \
  && busybox ln -f busybox sleep \
  && busybox ln -f busybox sort \
  && busybox ln -f busybox stat \
  && busybox ln -f busybox tail \
  && busybox ln -f busybox tar \
  && busybox ln -f busybox tee \
  && busybox ln -f busybox test \
  && busybox ln -f busybox time \
  && busybox ln -f busybox touch \
  && busybox ln -f busybox tr \
  && busybox ln -f busybox true \
  && busybox ln -f busybox uname \
  && busybox ln -f busybox uniq \
  && busybox ln -f busybox uptime \
  && busybox ln -f busybox wc \
  && busybox ln -f busybox wget \
  && busybox ln -f busybox which \
  && busybox ln -f busybox whoami \
  && busybox ln -f busybox xargs \
  && busybox ln -f busybox yes

CMD [ "/bin/sh" ]