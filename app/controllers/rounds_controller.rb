class RoundsController < ApplicationController
  def index
    @rounds = Round.all
  end

  def show
    @round = Round.find(params[:id])
  end

  def new
    @round = Round.new
  end

  def create
    @round = Round.new
    @round.game_id = params[:game_id]
    @round.category = params[:category]

    if @round.save
      redirect_to "/rounds", :notice => "Round created successfully."
    else
      render 'new'
    end
  end

  def edit
    @round = Round.find(params[:id])
  end

  def update
    @round = Round.find(params[:id])

    @round.game_id = params[:game_id]
    @round.category = params[:category]

    if @round.save
      redirect_to "/rounds", :notice => "Round updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @round = Round.find(params[:id])

    @round.destroy

    redirect_to "/rounds", :notice => "Round deleted."
  end
end
