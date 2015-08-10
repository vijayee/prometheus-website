package main

import (
	"github.com/go-martini/martini"
	"github.com/mytrile/nocache"
	"net/http"
	"log"
	"os"
	"fmt"
)

func main() {

	arguments := os.Args[1:]
	port:=arguments[0]
	server := martini.Classic()
	server.Use(martini.Static("../public"))
	server.Use(martini.Static("../assets/javascript/app"))
	server.Use(nocache.UpdateCacheHeaders())
	fmt.Printf(" listening on port %s\n", port)
	log.Fatal(http.ListenAndServe(":" + port, server))


}

