package main
import (
 "fmt"
 "net/http"
 "os"
)
func main() {
 var PORT string
 if PORT = os.Getenv("PORT"); PORT == "" {
  PORT = "3001"
 }
 http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
  fmt.Fprintf(w, "Hello World from path: %s\n", r.URL.Path)
 })
 http.ListenAndServe(":" + PORT, nil)
}

// https://medium.com/@rrgarciach/bootstrapping-a-go-application-with-docker-47f1d9071a2a