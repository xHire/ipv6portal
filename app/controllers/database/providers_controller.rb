# coding: utf-8
class Database::ProvidersController < Database::BaseController
	before_filter :select_category

	def list
		return if get_title.nil?

		# data for listing
		@providers = get_obj.all(:conditions => 'status = 1 or status = 2', :order => 'status, name ASC') + get_obj.all(:conditions => { :status => 0 }, :order => 'name ASC')
	end

	def new
		return if get_title.nil?

		@provider = get_obj.new
	end

	def create
		data = params[params[:type]]
		data[:created_at] = Time.now
		data[:updated_at] = Time.now
		data[:ip] = request.env['REMOTE_ADDR']
		data[:seoname] = data[:name].seolize

		@provider = get_obj.create data
		if @provider.save
			@provider.texts.create [ :author => data[:author], :email => data[:email], :ip => data[:ip], :created_at => data[:created_at], :content => params[:content] ] unless params[:content].nil? || params[:content].empty?
			redirect_to db_providers_path(params[:type])
		else
			get_title
			render :action => 'new'
		end
	end

	def letter
		return if get_title.nil?

		render :template => "database/providers/letter-#{params[:type]}"
	end

	def show
		get_title

		@provider = get_obj.first :conditions => { :seoname => params[:id] }

		unless @provider.nil?
			@title += ' ' + @provider.name
		else
			@title = 'Chyba'
		end
	end

	private
	def select_category
		@selected_category = params[:type]
	end

	def get_obj
		Object.module_eval("::#{params[:type].camelize}", __FILE__, __LINE__)
	end

	def get_title
		title = {}
		title[:list]  = { 'isp' => 'ISP', 'serverhousing' => 'serverhousingů', 'webhosting' => 'webhostingů' }
		title[:new]   = { 'isp' => 'ISP', 'serverhousing' => 'serverhousing', 'webhosting' => 'webhosting' }
		title[:show]  = { 'isp' => 'ISP', 'serverhousing' => 'Serverhousing', 'webhosting' => 'Webhosting' }

		begin
		case params[:action]
			when 'list'
				raise 'InvalidProvider' if title[:list][params[:type]].nil?
				@title = "Databáze #{title[:list][params[:type]]}"
			when 'new', 'create'
				raise 'InvalidProvider' if title[:new][params[:type]].nil?
				@title = "Přidat nový záznam: #{title[:new][params[:type]]}"
			when 'letter'
				raise 'InvalidProvider' if title[:new][params[:type]].nil?
				@title = "Vzorový e-mail pro #{title[:new][params[:type]]}"
			when 'show'
				raise 'InvalidProvider' if title[:show][params[:type]].nil?
				@title = title[:show][params[:type]]
		end
		rescue
			@title = 'Chyba'
			@provider = nil
			@providers = nil
			return nil
		end
	end
end
