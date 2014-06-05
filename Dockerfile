FROM debian:jessie

# install packages
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get install --no-install-recommends -y \
    locales \
    ruby \
    supervisor

# install foreman
RUN gem install foreman

CMD foreman
