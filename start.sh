
docker-compose build
docker-compose run --rm ms_users rails db:create
docker-compose run --rm ms_users rails db:migrate
docker-compose up
