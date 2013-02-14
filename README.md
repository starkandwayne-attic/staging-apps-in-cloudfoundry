# Demonstration of the Cloud Foundry stager service in isolation

In one terminal run the services:

```
$ git submodule update --init
$ bundle
$ foreman start
22:12:30 nats.1          | started with pid 24243
22:12:30 stager.1        | started with pid 24244
22:12:30 stager_client.1 | started with pid 24245
22:12:33 stager.1        | [2012-11-13 22:12:33.985133] vcap.stager.server - pid=24244 tid=a6d4 fid=c693   INFO -- Subscribed to staging
22:12:33 stager.1        | [2012-11-13 22:12:33.986252] vcap.stager.server - pid=24244 tid=a6d4 fid=c693   INFO -- Server running
22:12:34 stager_client.1 | [2012-11-13 22:12:34] INFO  WEBrick 1.3.1
22:12:34 stager_client.1 | [2012-11-13 22:12:34] INFO  ruby 1.9.3 (2012-10-12) [x86_64-darwin11.4.2]
22:12:34 stager_client.1 | == Sinatra/1.3.3 has taken the stage on 9292 for development with backup from WEBrick
22:12:34 stager_client.1 | [2012-11-13 22:12:34] INFO  WEBrick::HTTPServer#start: pid=24245 port=9292
```

In another terminal, run the request script:

```
$ ./bin/request_stager_to_stage_app
...
[2012-11-13 22:13:08] Setting up temporary directories
[2012-11-13 22:13:08] Downloading application
[2012-11-13 22:13:08] Unpacking application
[2012-11-13 22:13:08] Staging application
[2012-11-13 22:13:10] # Logfile created on 2012-11-13 22:13:10 -0800 by logger.rb/31641
[2012-11-13 22:13:10] Auto-reconfiguration disabled because app does not use Bundler.
[2012-11-13 22:13:10] Please provide a Gemfile.lock to use auto-reconfiguration.
[2012-11-13 22:13:10] Creating droplet
[2012-11-13 22:13:10] Uploading droplet
[2012-11-13 22:13:12] Done!
```


## Future development

If someone wants to add additional example applications, to create the tarballs of the original applications use the rake task:

```
$ rake package_apps
tar -czf apps/sinatra-app.tgz -C apps/sinatra-app/ .
```

If more apps are added:

* update `Rakefile` with the folder name
* update `apps/staging_client_service/app.rb` to be more specific about which application is downloaded

## Modifications for the tutorial

If you run the stager on OS/X then you'll need <a href="http://reviews.cloudfoundry.org/11414">this patch</a> to the stager source code. The patch stops using the -u flag on `env` command which isn't available on OS/X.

