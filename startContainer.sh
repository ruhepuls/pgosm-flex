docker run --name pgosm -d --rm \
    -v ~/pgosm-data:/app/output \
    -v /etc/localtime:/etc/localtime:ro \
    -v /home/florian/pgosm-flex/flex-config/layerset:/custom-layerset \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=postgres \
    -e POSTGRES_HOST=192.168.116.20 \
    -e POSTGRES_DB=osm_austria \
    -e POSTGRES_PORT=5432 \
    -p 5433:5432 -d rustprooflabs/pgosm-flex
