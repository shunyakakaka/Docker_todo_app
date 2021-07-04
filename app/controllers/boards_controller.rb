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

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update(board_params)
    flash[:notice] = "編集しました"
    redirect_to board_path(@board)
  end

  def destroy
    board = Board.find(params[:id])
    board.delete
    flash[:notice] = "#{board.title}を削除しました"
    redirect_to boards_path
  end
  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end
