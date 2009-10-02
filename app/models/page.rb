# encoding: utf-8
class Page < ActiveRecord::Base
  named_scope :get, lambda { |page|
    { :conditions => { :uri => page } }
  }
end
