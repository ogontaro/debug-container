#!/usr/bin/env -S deno run -A

async function getLatestHelmfileVersions() {
  try {
    const response = await fetch('https://api.github.com/repos/helmfile/helmfile/releases');
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const releases = await response.json();
    return releases.map((release: any) => release.tag_name).slice(0, 3);
  } catch (error) {
    console.error(error);
  }
}

async function buildParamsForVersions() {
  const versions = await getLatestHelmfileVersions();
  let today = new Date();
  let todayTag = `${today.getFullYear()}-${today.getMonth() + 1}-${today.getDate()}`;
  let buildParams = [];

  versions.forEach((version, index) => {
    let tags = [`${version}-${todayTag}`];
    if (index === 0) { // 最新バージョンの場合
      tags.push('latest', todayTag);
    }
    buildParams.push({
      repository: "ogontaro/argocd-helmfile-plugin",
      tags: tags,
      buildArgs: `--version ${version}`,
    });
  });
  return buildParams;
}

buildParamsForVersions().then(params => console.log(JSON.stringify(params)));
