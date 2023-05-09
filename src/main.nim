import jester
import std/[json, os, strutils]

router myrouter:
  get "/":
    resp %*{
      "nim": "jester",
      "hello": "world!"
    }

proc main() =
  # use the environment PORT variable or fall back to 3000
  let port = parseInt(getEnv("PORT", "3000")).Port
  let settings = newSettings(port = port)
  var jester = initJester(myrouter, settings = settings)
  # jester listens on all interfaces by default
  jester.serve()

when isMainModule:
  main()
