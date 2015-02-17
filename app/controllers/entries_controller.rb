class EntriesController < ApplicationController
  respond_to :json

  def index
    respond_with Entry.all
  end

  def create
    respond_with Entry.create(name: save_params[:name])
  end

  def show
    respond_with Entry.find(immutable_params[:id])
  end

  def update
    respond_with Entry.update(update_params[:id], winner: update_params[:winner])
  end

  def destroy
    respond_with Entry.destroy(immutable_params[:id])
  end

private
  def immutable_params
    params.permit(:id)
  end

  def save_params
    params.require(:entry).permit(:name)
  end

  def update_params
    params.require(:entry).permit(:id, :name, :winner)
  end
end
