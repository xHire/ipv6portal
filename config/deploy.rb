set :application, "ipv6portal"
set :repository,  "ssh://xhire@sykora.paskuli.cz/srv/git/ipv6portal.git"
set :scm, :git

set :git_enable_submodules, true

role :web, "sykora.paskuli.cz"
role :app, "sykora.paskuli.cz"
role :db,  "sykora.paskuli.cz", :primary => true

set :deploy_to, "/srv/web/ipv6portal.cz/www/"
set :user, "xhire"

set :use_sudo, false

task :after_update_code, :roles => [:app, :db] do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end


namespace :deploy do
	task :start, :roles => :app do
	end
end

namespace :deploy do
	desc "Restart Application"
	task :restart, :roles => :app do
		run "touch #{current_path}/tmp/restart.txt"
	end
end
