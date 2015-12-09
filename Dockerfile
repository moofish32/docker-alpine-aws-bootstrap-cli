FROM alpine:latest

RUN \
      mkdir -p /aws && \
      apk -Uuv add groff less python py-pip ca-certificates && \
      wget https://bootstrap.pypa.io/ez_setup.py -O - | python && \
      pip install awscli && \
      easy_install https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz && \
      apk --purge -v del py-pip && \
      rm /var/cache/apk/*

WORKDIR /aws

