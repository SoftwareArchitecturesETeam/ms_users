
docker-compose build
docker-compose run --rm ms-users rails db:create
docker-compose run --rm ms-users rails db:migrate
docker-compose up
