require 'sinatra'

get '/download_unstaged_app/:id' do
  puts "UNSTAGED APP BEING REQUESTED"
  p params
  unstaged_app_tgz = File.expand_path("../../sinatra-app.zip", __FILE__)
  send_file(unstaged_app_tgz)
end

post '/upload_droplet/:id/:upload_id' do
  puts "RECEIVING DROPLET"
  p params
  src_path = params[:upload][:droplet][:tempfile]
  droplet = params[:upload][:droplet][:tempfile].read
  puts "RECEIVED DROPLET: stager uploaded staged droplet #{src_path}"
end
