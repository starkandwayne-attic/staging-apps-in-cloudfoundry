nats: nats-server
stager: env BUNDLE_GEMFILE=./stager/Gemfile ./stager/bin/stager -c config/stager.yml
stager_client: env BUNDLE_GEMFILE=./apps/staging_client_service/Gemfile ruby apps/staging_client_service/app.rb -p 9292
