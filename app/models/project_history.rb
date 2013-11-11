class ProjectHistory < ActiveRecord::Base
  attr_accessible :drawings, :status, :notes, :footage, :approval_status

  def self.add_event(params)
    create(drawings: params[:drawings],
           status:   params[:status],
           approval_status:   params[:approval_status],
           notes:    params[:notes],
           footage:  params[:footage])
  end
end
