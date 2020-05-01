docker build -t nominatim .
docker run -t -v /projects/work/openstreet/nominatim.test/dataset:/data nominatim  sh /app/init.sh /data/monaco-latest.osm.pbf postgresdata 4
docker run --restart=always -p 6432:5432 -p 7070:8080 -d --name nominatim -v /projects/work/openstreet/nominatim.test/dataset/postgresdata:/var/lib/postgresql/11/main nominatim bash /app/start.sh
docker run --restart=always -p 7070:8080 -d -v/projects/work/openstreet/nominatim.test/conf:/data nominatim sh /app/startapache.sh
