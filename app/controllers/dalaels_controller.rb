class DalaelsController < ApplicationController
  before_action :set_dalael, only: [:show, :edit, :update, :destroy]
  def index
    @daleals = Dalael.preload(:lines).published.all
    respond_to do |format|
      format.html do
        @header = t('navbar.dalaels')
      end
      format.json do
        dalaels_json = @daleals.map { |dalael| DalaelPresenter.new(dalael).to_json }
        render json: dalaels_json, status: :ok
      end
    end
  end

  def show
    @header = t('navbar.dalaels') + ': ' + @daleal.name
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
