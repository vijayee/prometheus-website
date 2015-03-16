package main

import (
	"github.com/go-martini/martini"
	"github.com/martini-contrib/cors"
	"github.com/mytrile/nocache"
	"net/http"
	"log"
	"os"
	"fmt"
)
func main() {
	arguments := os.Args[1:]
	server:= martini.Classic()
	server.Use(martini.Static("../public"))
	server.Use(martini.Static("../assets/javascript/app"))
	server.Use(nocache.UpdateCacheHeaders())
	server.Use(cors.Allow(&cors.Options{
		AllowOrigins:     []string{"https://localhost:" + arguments[0]},
		AllowMethods:     []string{"POST", "GET"},
		AllowHeaders:     []string{"Origin", "Content-Type"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
	}))
	server.Get("/")
	fmt.Printf(" listening on port %s\n",arguments[0] )
	log.Fatal(http.ListenAndServe(":" + arguments[0], server))
}

