FROM ruby:3.4.7-slim-trixie

RUN apt-get update -qq && \
apt-get install -y curl && \
curl https://deb.nodesource.com/setup_22.x | bash && \
apt-get update && apt-get install --fix-missing --no-install-recommends -qq -y \
build-essential nodejs postgresql-client libpq-dev libyaml-dev git && \
apt-get upgrade -y && \
apt-get clean autoclean && \
apt-get autoremove -y && \
rm -rf \
/var/lib/apt \
/var/lib/dpkg \
/var/lib/cache \
/var/lib/log \
mkdir /app

WORKDIR /app

COPY . /app

RUN gem install bundler && \
bundle install

# RUN chmod a+x /app/web_entry.sh

ENTRYPOINT ["bundle", "exec"]

# CMD . /app/web_entry.sh
