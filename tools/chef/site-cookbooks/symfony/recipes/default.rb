
web_app "symfony.dev" do
  server_name "symfony.dev"
  server_aliases [node['fqdn'], "sf.dev"]
  docroot "/home/vagrant/symfony.dev/web"
  allow_override "All"
  cookbook "apache2"
end

