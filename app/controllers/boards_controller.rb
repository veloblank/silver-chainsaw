class BoardsController < ApplicationController

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.name = @board.date.strftime('%Y%m%d')
    if @board.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def show
    @board = Board.find_by(id: params[:id])
    @props = Prop.filter_and_sort_by_date(@board)
  end

  def edit
    @board = Board.find_by(id: params[:id])
  end

  def leaderboard
    @leaders = Leaderboard.top_25_monthly
  end

  def update
    @board = Board.find_by(id: params[:id])
    @board.update(board_params)
    redirect_to root_path
  end

  def destroy
    @board = Board.find_by(id: params[:id])
    @board.delete
    redirect_to root_path
  end

  private

  def board_params
    params.require(:board).permit(:date)
  end
end
