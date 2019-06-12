class BoardsController < ApplicationController

  def new
    @board = Board.new
  end

  def create


  end

  def show
    @board = Board.find_by(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def board_params
    params.require(:board).permit(:name, :scored?)
  end
end
