require "fileutils"

root = File.expand_path("..", __FILE__)

%w[sinatra-app].each do |app|
  file "apps/#{app}.tgz" => "apps/#{app}/" do |t|
    sh "tar -czf #{t.name} -C #{t.prerequisites[0]} ."
  end

  file "apps/#{app}.zip" => "apps/#{app}/" do |t|
    sh "cd #{t.prerequisites[0]}; zip -q -y #{root}/#{t.name} -r *"
  end
  desc "Package all apps/* into tarballs & zipfiles"
  task :package_apps => "apps/#{app}.tgz"
  task :package_apps => "apps/#{app}.zip"
end