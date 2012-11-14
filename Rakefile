
%w[sinatra-app].each do |app|
  file "apps/#{app}.tgz" => "apps/#{app}/" do |t|
    sh "tar -czf #{t.name} -C #{t.prerequisites[0]} ."
  end
  desc "Package all apps/* into tarballs"
  task :package_apps => "apps/#{app}.tgz"
end