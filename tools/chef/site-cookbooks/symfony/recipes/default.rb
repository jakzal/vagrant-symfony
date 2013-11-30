
execute "composer create-project" do
  command <<-EOF
    rm -rf /tmp/symfony.dev
    cd /tmp
    composer create-project --no-install symfony/framework-standard-edition /tmp/symfony.dev
    mv /tmp/symfony.dev/* #{node[:symfony][:project_path]}
    mv /tmp/symfony.dev/.travis.yml #{node[:symfony][:project_path]}/
    cat /tmp/symfony.dev/.gitignore >> #{node[:symfony][:project_path]}/.gitignore
    rm -rf /tmp/symfony.dev
  EOF
  action :run
  creates "#{node[:symfony][:project_path]}/composer.json"
end

execute "composer install" do
  command "composer install"
  action :run
  cwd node[:symfony][:project_path]
end

web_app node[:symfony][:domain] do
  server_name node[:symfony][:domain]
  server_aliases node[:symfony][:aliases]
  docroot "#{node[:symfony][:project_path]}/web"
  allow_override "All"
  directory_index node[:symfony][:default_front_controller]
  cookbook "symfony"
  template "symfony.conf.erb"
end
