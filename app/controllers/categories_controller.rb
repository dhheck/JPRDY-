class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    @category.name = params[:name]
    @category.theme = params[:theme]
    @category.round_id = params[:round_id]

    if @category.save
      redirect_to "/categories", :notice => "Category created successfully."
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    @category.name = params[:name]
    @category.theme = params[:theme]
    # @category.round_id = params[:round_id]

    respond_to do |format|
      if @category.save
        format.html {redirect_to :back, :notice => "Category updated successfully."}
        format.js {render 'update_categories.js.erb'}
      else
        format.html {render 'edit'}
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy

    redirect_to "/categories", :notice => "Category deleted."
  end
end
