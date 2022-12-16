download:
	wget https://www2.census.gov/geo/tiger/TIGER2017//STATE/tl_2017_us_state.zip
	unzip tl_2017_us_state.zip

install:
	npm install -g --silent geobuf
	go install github.com/deslittle/pinpoint/cmd/geojson2locpb@v0.2.0
	go install github.com/deslittle/pinpoint/cmd/reducelocpb@v0.2.0
	go install github.com/deslittle/pinpoint/cmd/compresslocpb@v0.2.0
	go install github.com/deslittle/pinpoint/cmd/preindexlocpb@v0.2.0
	go install github.com/deslittle/pinpoint/cmd/preindexlocpb@v0.2.0

gen: install download
	shp2geobuf tl_2017_us_state.shp > us-states.pbf
	geobuf2json us-states.pbf > us-states.json
	geojson2locpb us-states.json
	reducelocpb us-states.pb
	compresslocpb us-states.reduce.pb
	preindexlocpb us-states.reduce.pb

clean:
	rm -f *.zip tl_2017*.* *.json *.pbf
