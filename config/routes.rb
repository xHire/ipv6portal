ActionController::Routing::Routes.draw do |map|
	map.namespace :database, :name_prefix => 'db_', :path_prefix => 'databaze' do |db|
		db.providers			':provider_type', :controller => 'providers', :action => 'list'
		db.provider_show	':provider_type/:id/detail', :controller => 'providers', :action => 'show'
	end

	map.db 'databaze', :controller => 'database/base'

	map.root :controller => 'base'
end
