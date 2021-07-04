class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.save
    flash[:notice] = "#{@board.title}の掲示板を作りました"
    redirect_to boards_path
  end

  def edit
  end

  def show
  end
  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end
