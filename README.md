novasearch
==========
Novasearch is a nice and simple solr web
frontend based on [bottle](http://bottlepy.org/docs/dev/index.html).

Dataset preparation
-------------------

First you should store all pdfs in `dataset/pdf`, e.g. you have
`dataset/pdf/path/test.pdf` so you should store in:
`dataset/meta/path/test.json` the corresponding metafile, that has the following structure:
```
{
    "abstract": "abstract",
    "title": "pdf title"
}
```
The meta file will be used during search result presentation.

### Solr installation
Solr will be used as backend, so a simple call of `prepare.sh` will install solr in the dataset directory.

### Solr indexing
After you downloaded solr, you can easily start the index process, so change to dataset directory and run `index_build.sh`:
```
cd dataset
./index_build.sh
```

First start
-----------
After you indexed all your pdfs and all meta files are stored you can start novasearch via
```
./novaweb.py
```
It is necessary that solr is running (you can manually start it via `./start_solr.sh`).

The novasearch web service is now available via `http://localhost:6090`,
you can change port, binding, dataset, download user/password settings
by customizing `config.json`, an example configuration is already prepared.

Technical background
--------------------
Bibtex entries will be queried using dblp via stored title attribute in meta, because dblp bibtex
entries are clean and homogeneous.

Web-css is done by bootstrap.
