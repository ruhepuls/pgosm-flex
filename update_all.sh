import_pgosm_flex() {
    POSTGRES_HOST=$1
    POSTGRES_PORT=$2
    POSTGRES_DB=$3
    POSTGRES_USER=$4
    OUTPUT_DIR=$5
    RAM=$6
    REGION=$7
    SUBREGION=$8

    docker run --name pgosm --rm -v /home/florian/.pgpass:/root/.pgpass -v $OUTPUT_DIR:/app/output -v /etc/localtime:/etc/localtime:ro -e PGPASSFILE=/root/.pgpass -e PGUSER=$POSTGRES_USER -e POSTGRES_USER=$POSTGRES_USER -e POSTGRES_HOST=$POSTGRES_HOST -e POSTGRES_PORT=$POSTGRES_PORT -e POSTGRES_DB=$POSTGRES_DB cybertec/pgosm-flex-cybertec python3 docker/pgosm_flex.py \
        --layerset=riwa \
        --schema-name=public \
        --replication \
        --ram=$RAM \
        --region=$REGION \
        --subregion=$SUBREGION \
        --srid 4326
}


#import_pgosm_flex 10.0.0.91 5432 osm_germany postgres /home/florian/git/pgosm-flex-docker/output/germany 8 north-america/us district-of-columbia
import_pgosm_flex 192.168.116.20 5432 osm_austria postgres /home/florian/pgosm-data/austria 8 north-america/us district-of-columbia
#import_pgosm_flex 10.0.0.91 5432 osm_bayern postgres /home/florian/git/pgosm-flex-docker/output/bayern 8 north-america/us district-of-columbia
#import_pgosm_flex 10.0.0.91 5432 osm_dach postgres /home/florian/git/pgosm-flex-docker/output/dach 8 north-america/us district-of-columbia

#import_pgosm_flex 172.17.0.1 5432 osm_bayern  osm /mnt/pgdata/osm/pgosm-data/bayern  8  europe/germany bayern
#import_pgosm_flex 172.17.0.1 5432 osm_austria osm /mnt/pgdata/osm/pgosm-data/austria 16 europe austria
#import_pgosm_flex 172.17.0.1 5432 osm_dach    osm /mnt/pgdata/osm/pgosm-data/dach    16 europe dach
#import_pgosm_flex 172.17.0.1 5432 osm_luxembourg osm /mnt/pgdata/osm/pgosm-data/luxembourg    16 europe luxembourg
#import_pgosm_flex 172.17.0.1 5432 osm_switzerland osm /mnt/pgdata/osm/pgosm-data/switzerland  16 europe switzerland
