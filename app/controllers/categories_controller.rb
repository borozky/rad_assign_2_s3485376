class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show]
  before_action :authorize_admin, only: [:destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
    @title = "All categories"
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @title = "Category: #{@category.name}"
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        flash[:success] = "Category successfully created."
        format.html { redirect_to @category, success: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        flash.now[:danger] = "Failed to create category"
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        flash[:success] = "Category successfully updated."
        format.html { redirect_to @category }
        format.json { render :show, status: :ok, location: @category }
      else
        flash.now[:success] = "Failed to update category."
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      flash[:success] = "Category successfully deleted"
      format.html { redirect_to categories_url, success: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
