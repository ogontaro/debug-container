#!/usr/bin/env -S deno run -A

let today = new Date();
let todayTag = `${today.getFullYear()}-${today.getMonth() + 1}-${today.getDate()}`

let buildParams = [
  {
    repository: "ogontaro/debug-container",
    tags: ["latest", todayTag],
    buildArgs: "",
  }
]

console.log(JSON.stringify(buildParams));
