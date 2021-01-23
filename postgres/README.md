# Experimental postgres

These files document a way to switch openSenseMap to postgresql.

## Prepare a mongo instance

Run `yarn test dont_clean_up`. This will leave a mongo db container named `osemapitest_db_1`.

## Execute the experiment

- [Prepare a mongo instance](#prepare-a-mongo-instance)
- Run `docker-compose up postgres` in this directory
- Run `docker-compose exec -u postgres postgres psql` for a `psql` repl

## References/Interesting reads

- https://github.com/AmebaBrain/postgres_docker_images
- https://github.com/EnterpriseDB/mongo_fdw
