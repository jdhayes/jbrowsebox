# JBrowseBox

A basic Ubuntu container with Apache HTTPD and JBrowse installed.

### Prepare

1. First check out this repo
2. Build singularity image and place it under `images`
3. Add the `images` path to your PATH

You may need to prepare data sets under `/opt/miniconda2/envs/jbrowse/opt/jbrowse/data`?
Or possibly reconfigure JBrowse to use another directory?

## Usage

JBrowse commands can be run like so:

```
jbrowse flatfile-to-json.pl --help
```

### View Web
You can start the JBrowse web interface like so:

```
./jbrowse.sh
```
