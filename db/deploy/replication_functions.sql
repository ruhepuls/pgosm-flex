
BEGIN;


CREATE OR REPLACE PROCEDURE public.append_data_start()
 LANGUAGE plpgsql
 AS $$

 BEGIN

    RAISE NOTICE 'Truncating table public.place_polygon_nested;';
    TRUNCATE TABLE public.place_polygon_nested;

END $$;


CREATE OR REPLACE PROCEDURE public.append_data_finish(skip_nested BOOLEAN = False)
 LANGUAGE plpgsql
 AS $$
 BEGIN

    REFRESH MATERIALIZED VIEW public.vplace_polygon_subdivide;

    IF $1 = False THEN
        RAISE NOTICE 'Populating nested place table';
        CALL public.populate_place_polygon_nested();
        RAISE NOTICE 'Calculating nesting of place polygons';
        CALL public.build_nested_admin_polygons();

    END IF;


END $$;


COMMENT ON PROCEDURE public.append_data_start() IS 'Prepares PgOSM Flex database for running osm2pgsql in append mode.  Removes records from place_polygon_nested if they existed.';
COMMENT ON PROCEDURE public.append_data_finish(BOOLEAN) IS 'Finalizes PgOSM Flex after osm2pgsql-replication.  Refreshes materialized view and (optionally) processes the place_polygon_nested data.';




COMMIT;
