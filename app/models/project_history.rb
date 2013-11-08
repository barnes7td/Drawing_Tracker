class ProjectHistory < ActiveRecord::Base
  attr_accessible :drawings, :status, :notes

  def self.add_event(params)
    create(drawings: params[:drawings],
           status:   params[:status],
           notes:    params[:notes])
  end
end
