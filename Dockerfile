FROM ruby:3.1.2
RUN mkdir /app
WORKDIR /app
ARG _ARM_ARCH="arm-unknown-linux-gnu"

# mecab-ko
RUN set -ex \
	&& wget --no-check-certificate https://github.com/mnmandahalf/natto/raw/add-mecab-ko/etc/mecab-0.996-ko-0.9.2.tar.gz && tar xvf mecab-0.996-ko-0.9.2.tar.gz \
  && cd mecab-0.996-ko-0.9.2 \
  && if [ `uname -m` =  "aarch64" ]; then ./configure --build=${_ARM_ARCH} --host=${_ARM_ARCH} --target=${_ARM_ARCH}; \
     else ./configure; fi \
  && make && make install && ldconfig
# mecab-ko-dic
RUN set -ex \
  && wget --no-check-certificate https://github.com/mnmandahalf/natto/raw/add-mecab-ko/etc/mecab-ko-dic-2.1.1-20180720.tar.gz && tar xvf mecab-ko-dic-2.1.1-20180720.tar.gz \
  && cd mecab-ko-dic-2.1.1-20180720 && ./autogen.sh \
  && if [ `uname -m` =  "aarch64" ]; then ./configure --build=${_ARM_ARCH} --host=${_ARM_ARCH} --target=${_ARM_ARCH}; \
     else ./configure; fi \
  && make && make install && ldconfig
# userdic
COPY userdic mecab-ko-dic-2.1.1-20180720/user-dic
RUN cd mecab-ko-dic-2.1.1-20180720 && ./tools/add-userdic.sh && make install

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["sh", "docker-entrypoint.sh"]
EXPOSE 80

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "80"]
