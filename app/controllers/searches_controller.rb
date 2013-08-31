class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    # raise params.inspect
    @search = Search.create!(params[:search])
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end
end
