# BOSH Release for [Pravega](http://pravega.io) Streaming Storage

## Current Status

This release is officially working.  It's currently tested on BOSH on VirtualBox, and looking forward to mulit-cloud testing.

## Usage

To use this bosh release, first upload it to your bosh:

```
ENV=<my BOSH environment alias>
git clone github.com/greshwalk/pravega-bosh-release.git
cd pravega-bosh-release
bosh -e $ENV upload-release
bosh -e $ENV deploy ./manifests/pravega.yml
```

### TODO (also reflected in [issues](https://github.com/greshwalk/pravega-bosh-release/issues))

* Add smoke-test errand to ensure post-deploy operations
* Test in BOSH supported clouds
* Add options for multiple disks (when BOSH supports them properly)
* Add support for s3 secondary storage

### Development

As a developer of this release, create new releases and upload them:

```
ENV=<my BOSH environment alias>
bosh create-release --force && bosh -e $ENV upload-release
```
