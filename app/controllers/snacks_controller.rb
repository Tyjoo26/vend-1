class SnacksController < ApplicationController

  def show
    @snack = Snack.find(params[:id])
    # byebug
  end
end
