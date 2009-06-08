# coding: utf-8
class Database::BaseController < ApplicationController
	layout 'base'

	def index
		@title = "Databáze"
	end
end
