class Issue < ActiveRecord::Base
  belongs_to :tracker
  belongs_to :issue_status, :foreign_key => :status_id
  belongs_to :enumeration, :foreign_key => :priority_id
  attr_accessible :subject, :updated_on
end
