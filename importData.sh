docker exec -it \
    pgosm python3 docker/pgosm_flex.py \
    --ram=8 \
    --region=north-america/us \
    --subregion=district-of-columbia \
    --replication \
    --layerset=riwa \
    --layerset-path=/custom-layerset/ 
 
