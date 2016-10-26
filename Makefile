.PHONY: db

install:
	bundle install --path .bundle/gems --jobs=4

db:
	bundle exec rails db:create
	bundle exec rails db:migrate

serve:
	bundle exec rails server -p 3000 -b 0.0.0.0

build:
	docker build . -t endaaman/api.endaaman.me

push:
	docker push endaaman/api.endaaman.me
