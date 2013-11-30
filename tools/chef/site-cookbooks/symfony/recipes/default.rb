
web_app node[:symfony][:domain] do
  server_name node[:symfony][:domain]
  server_aliases node[:symfony][:aliases]
  docroot "#{node[:symfony][:project_path]}/web"
  allow_override "All"
  directory_index node[:symfony][:default_front_controller]
  cookbook "symfony"
  template "symfony.conf.erb"
end

