download:
	wget https://www2.census.gov/geo/tiger/TIGER2017//STATE/tl_2017_us_state.zip
	unzip tl_2017_us_state.zip

install:
	npm install -g --silent geobuf
	go install github.com/deslittle/pinpoint/cmd/geojson2locpb@main
	go install github.com/deslittle/pinpoint/cmd/reducelocpb@main
	go install github.com/deslittle/pinpoint/cmd/compresslocpb@main
	go install github.com/deslittle/pinpoint/cmd/preindexlocpb@main
	go install github.com/deslittle/pinpoint/cmd/preindexlocpb@main

gen: install download
	shp2geobuf tl_2017_us_state.shp > us-states.pbf
	geobuf2json us-states.pbf > us-states.json
	geojson2locpb us-states.json | xargs reducelocpb | xargs compresslocpb
	preindexlocpb us-states.reduce.pb

clean:
	rm -f *.zip tl_2017*.* *.json
