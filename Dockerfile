FROM 5003/builder:curl
RUN apk add --no-cache --virtual .builder libarchive-tools && \
    apk add --no-cache erlang \
                       erlang-inets \
                       erlang-ssl \
                       erlang-public-key \
                       erlang-asn1 \
                       erlang-sasl \
                       erlang-erl-interface \
                       erlang-dev \
      # ref ==> https://github.com/alpinelinux/aports/blob/702eaaa2c61e00e5e0568767b8ee1d49fc77647f/community/elixir/APKBUILD
                       erlang-crypto \
                       erlang-syntax-tools \
                       erlang-parsetools \
                       erlang-eunit \
                       erlang-tools && \
    curl --location https://github.com/elixir-lang/elixir/releases/download/v1.2.6/Precompiled.zip \
    | bsdtar --extract --file - --directory /usr/local/ && \
    chmod -R +x /usr/local/bin/ && \
    apk del --no-cache .builder
CMD ["iex"]