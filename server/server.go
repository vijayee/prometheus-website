package main

import (
	"github.com/go-martini/martini"
	"github.com/martini-contrib/cors"
	"github.com/mytrile/nocache"
	"os/exec"
	"net/http"
	"strings"
	"log"
	"os"
	"fmt"
)

func printCommand(cmd *exec.Cmd) {
	fmt.Printf("==> Executing: %s\n", strings.Join(cmd.Args, " "))
}

func printError(err error) {
	if err != nil {
		os.Stderr.WriteString(fmt.Sprintf("==> Error: %s\n", err.Error()))
	}
}

func printOutput(outs []byte) {
	if len(outs) > 0 {
		fmt.Printf("==> Output: %s\n", string(outs))
	}
}
func main() {

	fmt.Printf("Ghost Blog Started\n")
	cmd := exec.Command("node", "ghost-server.js")
	err := cmd.Start()
	if err != nil {
		fmt.Printf("==> Error: %s\n", err.Error())
	}

	arguments := os.Args[1:]
	port:=arguments[0]
	server := martini.Classic()
	server.Use(martini.Static("../public"))
	server.Use(martini.Static("../assets/javascript/app"))
	server.Use(nocache.UpdateCacheHeaders())
	server.Use(cors.Allow(&cors.Options{
		AllowOrigins:     []string{"https://localhost:" + port},
		AllowMethods:     []string{"POST", "GET"},
		AllowHeaders:     []string{"Origin", "Content-Type"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
	}))
	server.Get("/")
	fmt.Printf(" listening on port %s\n", port)
	log.Fatal(http.ListenAndServe(":" + port, server))


}

