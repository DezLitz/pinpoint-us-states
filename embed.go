package usstates

import (
	_ "embed"
)

//go:embed us-states.pb
var FullData []byte

//go:embed us-states.reduce.pb
var LiteData []byte

//go:embed us-states.reduce.compress.pb
var LiteCompressData []byte

//go:embed us-states.reduce.preindex.pb
var PreindexData []byte
