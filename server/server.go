package main

import (
	"github.com/go-martini/martini"
	"github.com/martini-contrib/cors"
	"github.com/mytrile/nocache"
	"net/http"
	"log"
)
func main() {
	server:= martini.Classic()
	server.Use(martini.Static("../public"))
	server.Use(martini.Static("../assets/javascript/app"))
	server.Use(nocache.UpdateCacheHeaders())
	server.Use(cors.Allow(&cors.Options{
		AllowOrigins:     []string{"https://localhost:3000"},
		AllowMethods:     []string{"POST", "GET"},
		AllowHeaders:     []string{"Origin", "Content-Type"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
	}))
	server.Get("/")

	log.Fatal(http.ListenAndServe(":3000", server))
}

