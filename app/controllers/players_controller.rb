class PlayersController < ApplicationController
  before_action :set_before, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]  # this line autenticate all player controller.
  
  def index
    if params[:param_position].blank?
     @players = Player.order('user_id ASC')
     @positions = Position.all.order('id ASC')
    else
     @positions = Position.all.order('id ASC')
      @position_id = Position.find_by_name(params[:param_position]).id
       @players = Player.all.where(:position_id => @position_id)
    end  
  end

  def show
    #function set_before.
    if @player.reviews.blank?
      @average_review = 0
    else
      @average_review = @player.reviews.average(:rating).round(2)
    end  
  end

  def new
    @player = current_user.players.build
    @position = Position.all.map{|p| [ p.name, p.id] }
  end
  
  def create
     @player = current_user.players.build(player_params)
      if @player.save
        redirect_to players_path, notice: " Player Created Successfully."
      else
        render 'new'
      end 
  end 
  
  def edit
    #function set_before.
    @position = Position.all.map{|p| [ p.name, p.id] }
  end
  
  def update
    if @player.update(player_params)
      redirect_to player_path(@player.id), notice: "Player Edited Successfully."
    else
      render 'edit'
    end  
  end  

  def delete
    #function set_before.
  end
  
  def destroy
    @player.destroy
    redirect_to players_path
  end  
  
  private
  
    def player_params
      params.require(:player).permit(:name, :age, :description, :position_id, :photo )
    end  
    
    def set_before
       @player = Player.find(params[:id])
    end  
  
end
