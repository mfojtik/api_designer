Ruby REST API designer
======================

This is a simple DSL that you can use to produce a schema and model relations
between REST resources using Ruby classes.

You can also export the ERD (entity relationship diagram) to PNG file
using Graphviz.

Install
----------

```shell
$ git clone https://github.com/mfojtik/api_designer.git
$ cd api_designer
$ bundle
$ bundle exec rake generate
```

Or to open an interactive console with all models loaded:

```shell
$ bundle exec rake console
```

License: ASF2.0
