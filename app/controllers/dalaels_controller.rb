class DalaelsController < ApplicationController
  before_action :set_dalael, only: [:show, :edit, :update, :destroy]
  Header = 'دلائل الخيرات'
  def index
    @daleals = Dalael.published.all
    @header = Header
  end

  def show
    @header = Header + ': ' + @daleal.name
  end

  def next
  end

  def previous

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dalael
      @daleal = Dalael.find(params[:id])
    end

end
