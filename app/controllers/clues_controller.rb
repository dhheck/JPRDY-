class CluesController < ApplicationController
  def index
    @clues = Clue.all
  end

  def show
    @clue = Clue.find(params[:id])
  end

  def new
    @clue = Clue.new
  end

  def create
    @clue = Clue.new
    @clue.category_id = params[:category_id]
    @clue.unrevealed = params[:unrevealed]
    @clue.value = params[:value]
    @clue.right = params[:right]
    @clue.wrong = params[:wrong]
    @clue.no_resp = params[:no_resp]

    if @clue.save
      redirect_to "/clues", :notice => "Clue created successfully."
    else
      render 'new'
    end
  end

  def edit
    @clue = Clue.find(params[:id])
  end

  def update
    @clue = Clue.find(params[:id])

    # @clue.category_id = params[:category_id]
    # @clue.unrevealed = params[:unrevealed]
    # @clue.value = params[:value]
    @clue.right = params[:right]
    @clue.wrong = params[:wrong]
    @clue.no_resp = params[:no_resp]

    if @clue.save
      redirect_to :back, :notice => "Clue updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @clue = Clue.find(params[:id])

    @clue.destroy

    redirect_to "/clues", :notice => "Clue deleted."
  end
end
