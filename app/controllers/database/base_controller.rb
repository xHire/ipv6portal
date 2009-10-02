# encoding: utf-8
class Database::BaseController < ApplicationController
  layout 'base'

  before_filter :category_list

  def index
    @title = "Databáze"
  end

  private
  def category_list
    @categories = [ { :id => 'isp', :title => 'ISP', :type => 'providers' },
                    { :id => 'serverhousing', :title => 'Serverhousing', :type => 'providers' },
                    { :id => 'webhosting', :title => 'Webhosting', :type => 'providers' },
                    { :id => 'isp-velkoobchod', :title => 'ISP - velkoobchod', :type => 'providers' }
                  ]
  end
end
