class Enumeration < ActiveRecord::Base

  set_inheritance_column "inheritance"
  has_many :issues
  
  attr_accessible :name, :type
end
