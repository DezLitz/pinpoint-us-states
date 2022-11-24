# [tzf](https://github.com/deslittle/tzf)'s preprocessed timezone data

## Update Data Steps

1. Download latest `timezones-with-oceans.geojson.zip` from https://github.com/evansiroky/timezone-boundary-builder/releases
2. Run:

   ```bash
   # Install cli tools
   make install
   # Produce new data
   make gen
   # stage
   git add combined-with-oceans.pb
   git add combined-with-oceans.reduce.pb
   git add combined-with-oceans.reduce.compress.pb
   # commit
   git commit -m "bump to xxx"
   git push
   ```

## Refer

- Protocol Buffers define: <https://github.com/deslittle/tzf/blob/main/pb/tzinfo.proto>
- Maintain tools
  - [`geojson2tzpb`](https://github.com/deslittle/tzf/tree/main/cmd/geojson2tzpb)
  - [`reducetzpb`](https://github.com/deslittle/tzf/tree/main/cmd/reducetzpb)
  - [`compresstzpb`](https://github.com/deslittle/tzf/tree/main/cmd/compresstzpb)
  - [`preindextzpb`](https://github.com/deslittle/tzf/tree/main/cmd/preindextzpb)
- To view data in GeoJSON format(which is more convenient to show on map), see <https://github.com/deslittle/tzf-server>

Usage:

- Go: <https://github.com/deslittle/tzf>
- Rust: <https://github.com/deslittle/tzf-rs>
