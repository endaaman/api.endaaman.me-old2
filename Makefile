.PHONY: server db install build push start stop

serve:
	rm -f tmp/pids/server.pid
	bundle exec rails server -p 3000 -b 0.0.0.0

db:
	bundle exec rails db:create
	bundle exec rails db:migrate

install:
	bundle install --path .bundle/gems --jobs=4

build:
	docker build . -t endaaman/api.endaaman.me

push: build
	docker push endaaman/api.endaaman.me

start: build
	docker-compose up -d --build

stop:
	docker-compose stop

