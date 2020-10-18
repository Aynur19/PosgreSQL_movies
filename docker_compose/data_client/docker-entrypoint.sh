
case "$1" in
    load)
        pipenv run python3 load_data.py
        ;;
    pipenv)
        pipenv install --deploy
        chmod -R 777 ./.venv
        chmod -R 777 ./.cache
        ;;
    service)
        pipenv run python3 src/simple_service.py
        ;;
    psql)
        psql -h postgres_host -U postgres
        ;;
    test)
        psql -h postgres_host -U postgres -c 'SELECT COUNT(*) as cnt FROM movie.ratings'
        ;;
    *)
        exec "$@"
esac 
