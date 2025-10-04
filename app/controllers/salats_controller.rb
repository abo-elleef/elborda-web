class SalatsController < ApplicationController
  before_action :set_salat, only: [:show, :edit, :update, :destroy]
  
  def index
    @salats = Salat.preload(:lines).published.all
    respond_to do |format|
      format.html do
        @header = t('navbar.salats')
      end
      format.json do
        salats_json = @salats.map { |salat| SalatPresenter.new(salat).to_json }
        render json: salats_json, status: :ok
      end
    end
  end

  def show
    @header = t('navbar.salats') + ': ' + @salat.name
  end

  def next
  end

  def previous

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salat
      @salat = Salat.find(params[:id])
    end
end
