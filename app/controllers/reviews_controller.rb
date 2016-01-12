class ReviewsController < ApplicationController
  before_action :find_player
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.player_id = @player.id
    @review.user_id  = current_user.id
    if @review.save
      redirect_to player_path(@player)
    else
      render 'new'
      
    end 
  end  
  
  def edit
   # @review find at before action 
  end
  
  def update
     # @review find at before action 
    if @review.update(review_params)
      redirect_to player_path(@player)
    else
      render 'edit'
    end  
  end  
  
  def destroy
    @review.destroy
    redirect_to player_path(@player)
  end  

  private
  
    def review_params
      params.require(:review).permit(:rating, :comment)  
    end
    
    def find_review
      @review = Review.find(params[:id])
    end  
    
    def find_player
      @player = Player.find(params[:player_id])
    end

end


