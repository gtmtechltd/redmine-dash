class ApplicationController < ActionController::Base
  protect_from_forgery

  def index 
    @trackers = Tracker.find(:all)
    @issues = Issue.find(:all, :order => "priority_id DESC, updated_on DESC")
    @statuses = IssueStatus.find(:all)
    @priorities = Enumeration.where(:type => "IssuePriority")
  
    @status_issues = {}
    @statuses.each do |status|
      @status_issues[status.name.to_sym] = []
    end
  
    @issues.each do |issue|
      next if issue.tracker.name.downcase != params[:controller] and params[:controller] != "home"
      case issue.issue_status.name.downcase
      when "closed"
        @status_issues[issue.issue_status.name.to_sym] << issue if issue.updated_on > Time.zone.now - 3.days
      when "rejected"
        @status_issues[issue.issue_status.name.to_sym] << issue if issue.updated_on > Time.zone.now - 7.days
      else
        @status_issues[issue.issue_status.name.to_sym] << issue
      end        
    end
  end
    
end
