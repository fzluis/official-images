#!/bin/bash
set -e

globalTests+=(
	utc
	cve-2014--shellshock
	no-hard-coded-passwords
	override-cmd
)

# for "explicit" images, only run tests that are explicitly specified for that image/variant
explicitTests+=(
	[:onbuild]=1
)
imageTests[:onbuild]+='
	override-cmd
'

testAlias+=(
	[iojs]='node'
	[jruby]='ruby'
	[pypy]='python'

	[ubuntu]='debian'
	[ubuntu-debootstrap]='debian'

	[mariadb]='mysql'
	[percona]='mysql'
)

imageTests+=(
	[aerospike]='
	'
	[busybox]='
	'
	[cassandra]='
		cassandra-basics
	'
	[celery]='
	'
	[clojure]='
	'
	[crate]='
	'
	[debian]='
		debian-apt-get
	'
	[docker:dind]='
		docker-dind
	'
	[django]='
	'
	[elasticsearch]='
		elasticsearch-basics
	'
	[erlang]='
		erlang-hello-world
	'
	[gcc]='
		gcc-c-hello-world
		gcc-cpp-hello-world
	'
	[golang]='
		golang-hello-world
	'
	[haskell]='
		haskell-cabal
		haskell-ghci
		haskell-runhaskell
	'
	[hylang]='
		hylang-sh
		hylang-hello-world
	'
	[java]='
	'
	[jetty]='
		jetty-hello-web
	'
	[julia]='
		julia-hello-world
	'
	[memcached]='
	'
	[mongo]='
		mongo-basics
	'
	[mono]='
	'
	[mysql]='
		mysql-basics
		mysql-initdb
		mysql-log-bin
	'
	[node]='
		node-hello-world
	'
	[nuxeo]='
		nuxeo-conf
		nuxeo-basics
	'
	[percona]='
	'
	[perl]='
		perl-hello-world
	'
	[php]='
		php-ext-install
		php-hello-world
	'
	[php:apache]='
		php-apache-hello-web
	'
	[php:fpm]='
		php-fpm-hello-web
	'
	[postgres]='
		postgres-basics
		postgres-initdb
	'
	[python]='
		python-hy
		python-imports
		python-pip-requests-ssl
		python-sqlite3
	'
	[rabbitmq]='
	'
	[r-base]='
	'
	[rails]='
	'
	[redis]='
		redis-basics
	'
	[rethinkdb]='
	'
	[ruby]='
		ruby-hello-world
		ruby-standard-libs
		ruby-gems
		ruby-bundler
		ruby-nonroot
	'
	[tomcat]='
	'
	[wordpress]='
	'
# example onbuild
#	[python:onbuild]='
#		py-onbuild
#	'
)

globalExcludeTests+=(
	# single-binary images
	[hello-world_utc]=1
	[swarm_utc]=1
	[nats_utc]=1

	[hello-world_no-hard-coded-passwords]=1
	[swarm_no-hard-coded-passwords]=1
	[nats_no-hard-coded-passwords]=1

	[hello-world_override-cmd]=1
	[swarm_override-cmd]=1
	[nats_override-cmd]=1

	# no "native" dependencies
	[ruby:alpine_ruby-bundler]=1
	[ruby:alpine_ruby-gems]=1
	[ruby:slim_ruby-bundler]=1
	[ruby:slim_ruby-gems]=1
)
