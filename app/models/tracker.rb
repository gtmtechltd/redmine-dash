class Tracker < ActiveRecord::Base
  has_many :issues
  attr_accessible :name
end
