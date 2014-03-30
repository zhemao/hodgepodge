package main

import (
	"net/http"
	"flag"
	"log"
	"fmt"
)

var rootdir = flag.String("rootdir", "./",
			  "which directory to serve files from")
var address = flag.String("address", ":8080",
			  "address to bind server to")

func main() {
	flag.Parse()
	http.Handle("/", http.FileServer(http.Dir(*rootdir)))
	fmt.Printf("serving %s from %s\n", *rootdir, *address)
	err := http.ListenAndServe(*address, nil)
	if err != nil {
		log.Fatal(err)
	}
}
