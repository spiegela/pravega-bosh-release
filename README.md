# BOSH Release for [Pravega](http://pravega.io) Streaming Storage

## Usage

To use this bosh release, first upload it to your bosh:

```
bosh target BOSH_HOST
git clone github.com/greshwalk/pravega-bosh-release.git
cd pravega-bosh-release
bosh upload release releases/pravega/pravega-1.yml
```

### Development

As a developer of this release, create new releases and upload them:

```
bosh create release --force && bosh -n upload release
```

### Final releases

To share final releases:

```
bosh create release --final
```

By default the version number will be bumped to the next major number. You can specify alternate versions:


```
bosh create release --final --version 1.1
```

After the first release you need to contact [Dmitriy Kalinin](mailto://dkalinin@pivotal.io) to request your project is added to https://bosh.io/releases (as mentioned in README above).
