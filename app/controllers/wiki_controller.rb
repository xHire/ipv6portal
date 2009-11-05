# encoding: utf-8
class WikiController < ApplicationController
  layout 'base'

  # GET wiki_url(:page)
  def index
    @page = Page.get params[:page]
    redirect_to :action => :new if @page.nil?
  end

  # GET new_wiki_url(:page)
  def new
    render :text => 'nova stranka'
  end

  # POST create_wiki_url(:page)
  # GET edit_wiki_url(:page)
  # PUT update_wiki_url(:page)
end
