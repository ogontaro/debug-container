#!/usr/bin/env -S deno run -A
import { walkSync } from "https://deno.land/std/fs/mod.ts";
import { join, dirname } from "https://deno.land/std/path/mod.ts";

interface BuildParams {
  repository: string;
  tags: string[];
  buildArgs: string;
}

const matrix: { dir: string; params: BuildParams[] }[] = [];

async function loadParams(dirPath: string) {
  try {
    const params: BuildParams[] = await import(`file://${join(dirPath, "build-params.ts")}`);
    matrix.push({ dir: dirPath, params });
  } catch (error) {
    console.error(`Error loading build-params.ts in ${dirPath}:`, error);
  }
}

for (const dir of walkSync(Deno.cwd())) {
  if (dir.isFile && dir.name === "build-params.ts") {
    const dirPath = dirname(dir.path);
    await loadParams(dirPath);
  }
}

console.log(JSON.stringify(matrix));
