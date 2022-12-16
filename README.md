# [pinpoint](https://github.com/deslittle/pinpoint)'s preprocessed US States location data


## Update Data Steps

1. Run:

   ```bash
   # Install cli tools
   make install
   # Produce new data
   make gen
   # Remove intermediate files
   make clean
   # stage
   git add -A
   # commit
   git commit -m "bump to xxx"
   git push
   ```

## Refer

- Protocol Buffers define: <https://github.com/deslittle/pinpoint/blob/main/pb/locinfo.proto>
- Maintain tools
  - [`geojson2locpb`](https://github.com/deslittle/pinpoint/tree/main/cmd/geojson2locpb)
  - [`reducelocpb`](https://github.com/deslittle/pinpoint/tree/main/cmd/reducelocpb)
  - [`compresslocpb`](https://github.com/deslittle/pinpoint/tree/main/cmd/compresslocpb)
  - [`preindexlocpb`](https://github.com/deslittle/pinpoint/tree/main/cmd/preindexlocpb)
Usage:

- Go: <https://github.com/deslittle/pinpoint>
