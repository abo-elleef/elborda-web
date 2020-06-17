class LinksController < ApplicationController

  def show
    @link = Link.find(params[:id])
    render :show, layout: false
  end
end
