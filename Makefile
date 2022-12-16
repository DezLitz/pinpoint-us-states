download:
	wget https://www2.census.gov/geo/tiger/TIGER2017//STATE/tl_2017_us_state.zip
	unzip tl_2017_us_state.zip

install:
	npm install -g --silent geobuf
	go install github.com/deslittle/pinpoint/cmd/geojson2locpb@v0.3.1
	go install github.com/deslittle/pinpoint/cmd/reducelocpb@v0.3.1
	go install github.com/deslittle/pinpoint/cmd/compresslocpb@v0.3.1
	go install github.com/deslittle/pinpoint/cmd/preindexlocpb@v0.3.1
	go install github.com/deslittle/pinpoint/cmd/preindexlocpb@v0.3.1

gen: clean install download
	shp2geobuf tl_2017_us_state.shp > us-states.pbf
	geobuf2json us-states.pbf > us-states-allprops.json
	namegeojson us-states-allprops.json us-states-allstates.json STATEFP
	filtergeojson us-states-allstates.json us-states.json "34" "42" "18"
	geojson2locpb us-states.json
	reducelocpb us-states.pb
	compresslocpb us-states.reduce.pb
	preindexlocpb us-states.reduce.pb

clean:
	rm -f *.zip tl_2017*.* *.json *.pbf
