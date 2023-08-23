class BulletinBoardsController < ApplicationController
    def index
      bulletin_boards = BulletinBoard.all
      render json: bulletin_boards
    end
  
    def show
      bulletin_board = BulletinBoard.find(params[:id])
      render json: bulletin_board
    end
  
    def create
      bulletin_board = BulletinBoard.new(bulletin_board_params)
      if bulletin_board.save
        render json: bulletin_board
      else
        render json: { error: "Something went wrong" }, status: :unprocessable_entity
      end
    end
  
    def update
      bulletin_board = BulletinBoard.find(params[:id])
      if bulletin_board.update(bulletin_board_params)
        render json: bulletin_board
      else
        render json: { error: "Something went wrong" }, status: :unprocessable_entity
      end
    end
  
    def destroy
      bulletin_board = BulletinBoard.find(params[:id])
      bulletin_board.destroy
      head :no_content
    end
  
    private
  
    def bulletin_board_params
      params.require(:bulletin_board).permit(:title, :body)
    end
  end
  