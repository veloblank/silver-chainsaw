class BoardsController < ApplicationController

  def new
    @board = Board.new
  end

  def create


  end

  def show
    #could not use @board = Board.find_by(params[:id]) for some reason
    #object would always have id=1

    @board = Board.find_by(id: params[:id])
    @props = Prop.filter_and_sort_by_date(@board.name.to_date)
  end

  def edit

  end

  def leaderboard

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
