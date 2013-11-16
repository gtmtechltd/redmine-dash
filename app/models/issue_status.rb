class IssueStatus < ActiveRecord::Base
  attr_accessible :name, :is_closed
  has_many :issues
end
