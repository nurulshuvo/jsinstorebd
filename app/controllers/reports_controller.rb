class ReportsController < ApplicationController
  def create
    Report.create!(topic: params[:product], body: params[:user])
    redirect_to root_path
  end
end
