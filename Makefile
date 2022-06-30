#!make
# https://github.com/zentered/makefile-example
# https://alextan.medium.com/makefile-101-56ba4590025b
# https://medium.com/stack-me-up/using-makefiles-the-right-way-a82091286950

MAKEFLAGS += --silent
-include .env
-include .env.${ENV}
export $(shell sed 's/=.*//' .env)

$(info VAR="$(ENV)")

prod:
		NODE_ENV=prod \
		LOG_ENABLED=true \
		LOG_LEVEL=silent \
		node index.js
		
enable_log: debug
		LOG_ENABLED=true \
		LOG_LEVEL=verbose \
		echo "logs enabled"

dev:
		NODE_ENV=dev \
		LOG_ENABLED=false \
		node index.js

debug:
		NODE_ENV=debug \
		node index.js \

test: 
		NODE_ENV=test \
		LOG_ENABLED=false \
		node index.js	


.PHONY: prod
.PHONY: debug
.PHONY: dev
.PHONY: test
.PHONY: enable_log
