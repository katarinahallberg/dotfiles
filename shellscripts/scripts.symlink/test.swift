#!/usr/bin/env xcrun swift

println("Process.arguments gave args:")
for s in Process.arguments {
  println(s)
}
