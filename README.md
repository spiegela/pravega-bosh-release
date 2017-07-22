# BOSH Release for [Pravega](http://pravega.io) Streaming Storage [WIP]

## Current Status

This is a work in progress. Right now, I'm just building up some of the pre-reqs, and working my way towards actual Pravega.

## Usage

To use this bosh release, first upload it to your bosh:

```
ENV=<my BOSH environment alias>
git clone github.com/greshwalk/pravega-bosh-release.git
cd pravega-bosh-release
bosh -e $ENV upload-release
bosh -e $ENV deploy ./manifests/pravega.yml
```

### Development

As a developer of this release, create new releases and upload them:

```
ENV=<my BOSH environment alias>
bosh create-release --force && bosh -e $ENV upload-release
```

### Final releases

To share final releases:

```
bosh create-release --final
```

By default the version number will be bumped to the next major number. You can specify alternate versions:


```
bosh create-release --final --version 1.1
```

After the first release you need to contact [Dmitriy Kalinin](mailto://dkalinin@pivotal.io) to request your project is added to https://bosh.io/releases (as mentioned in README above).
