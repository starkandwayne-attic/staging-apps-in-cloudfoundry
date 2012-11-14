

```
$ bundle exec bin/stage_app
```

To create the tarballs of the original applications use the rake task:

```
$ rake package_apps
tar -czf apps/sinatra-app.tgz -C apps/sinatra-app/ .
```

If more apps are added, update `Rakefile` with the folder name.
