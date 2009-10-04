# encoding: utf-8
class Database::ProvidersController < Database::BaseController
  before_filter :translate_type
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
    redirect_to db_providers_path(params[:type])
    return

    data = params[@type.gsub('-', '_')]
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

    render :template => "database/providers/letter-#{@type}"
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
    @selected_category = @type
  end

  def get_obj
    Object.module_eval("::#{@type.gsub('-', '_').camelize}", __FILE__, __LINE__)
  end

  def get_title
    title = {}
    title[:list]  = { 'isp' => 'ISP', 'isp-wholesale' => 'velkoobchodních ISP', 'serverhousing' => 'serverhousingů', 'webhosting' => 'webhostingů' }
    title[:new]   = { 'isp' => 'ISP', 'isp-wholesale' => 'velkoobchodní ISP', 'serverhousing' => 'serverhousing', 'webhosting' => 'webhosting' }
    title[:letter]  = { 'isp' => 'ISP', 'isp-wholesale' => 'velkoobchodního ISP', 'serverhousing' => 'serverhousing', 'webhosting' => 'webhosting' }
    title[:show]  = { 'isp' => 'ISP', 'isp-wholesale' => 'Velkoobchodní ISP', 'serverhousing' => 'Serverhousing', 'webhosting' => 'Webhosting' }

    begin
    case params[:action]
      when 'list'
        raise 'InvalidProvider' if title[:list][@type].nil?
        @title = "Databáze #{title[:list][@type]}"
      when 'new', 'create'
        raise 'InvalidProvider' if title[:new][@type].nil?
        @title = "Přidat nový záznam: #{title[:new][@type]}"
      when 'letter'
        raise 'InvalidProvider' if title[:letter][@type].nil?
        @title = "Vzorový e-mail pro #{title[:letter][@type]}"
      when 'show'
        raise 'InvalidProvider' if title[:show][@type].nil?
        @title = title[:show][@type]
    end
    rescue
      @title = 'Chyba'
      @provider = nil
      @providers = nil
      return nil
    end
  end

  def translate_type
    case params[:type]
      when 'isp-velkoobchod'
        @type = 'isp-wholesale'
      else
        @type = params[:type]
    end
  end
end
