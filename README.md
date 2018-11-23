# AXIOM-beta-Platform-Supports
This repo contains all the configs and pre-built binaries in releases for AXIOM beta platform.

The dist (distribution) folder is a empty folder for containing the files for version releases.

# How to Build
Unless your environment is set up for cross compilation, run `./build.sh` instead of the native `make`.
Done!

## Create a new release
Publish to releases ./publish.sh -v ${VER_NUM} -t ${GITHUB_TOKEN} -r axiom-PR-playground/AXIOM-beta-Platform-Supports

# Management
This repo is managed by [git subrepo](https://github.com/ingydotnet/git-subrepo) for simpler use.
To upgrade the sub repo, please install [git subrepo](https://github.com/ingydotnet/git-subrepo) for management,
Other users does not need to do so. :D

## Update sub-repos
``` bash
git subrepo pull u-boot-xlnx
git subrepo pull zynq-mkbootimage
```

Done!!!


# License
TBA
