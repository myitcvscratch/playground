package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"github.com/kr/pretty"
)

func main() {
	var r cue.Runtime
	fmt.Printf("Hello world!: %v, %v", pretty.Sprint(5), r)
}
