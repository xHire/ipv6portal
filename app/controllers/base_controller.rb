# coding: utf-8
class BaseController < ApplicationController
	before_filter :category_list

	def index
		@title = "Krátce úvodem"
	end

	private
	def category_list
		@categories = [ { :id => '', :title => 'Hlavní stránka' }
									]
	end
end
