

```
$ bundle exec bin/stage_app
```

To create the tarballs of the original applications use the rake task:

```
$ rake package_apps
tar -czf apps/sinatra-app.tgz -C apps/sinatra-app/ .
```

If more apps are added, update `Rakefile` with the folder name.

## Modifications for the tutorial

If you run the stager on OS/X then you'll need <a href="http://reviews.cloudfoundry.org/11414">this patch</a> to the stager source code. The patch stops using the -u flag on `env` command which isn't available on OS/X.

