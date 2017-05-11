class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :vote]
  before_action :authorize, except: [:index, :show]
  before_action :can_edit_course?, only: [:edit, :update, :destroy]
  
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    @coordinators = []
    @courses.each do |course|
      @coordinators << course.user
    end
    @title = "All Courses"
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST
  def vote
    unless current_user
      render json: { message: "Only logged in users are allowed to vote"}, status: :unprocessable_entity
      return
    end

    @vote = Vote.new
    @vote.user = current_user
    @vote.course = @course
    @vote.thumbs_up = params[:vote]

    if @vote.save
      render json: { message: "Success" }, status: :created
    else
      render json: @vote.errors, status: :unprocessable_entity
    end

  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    if current_user
      @course.user = current_user
    end

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, success: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, success: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # no user can delete course

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :prerequisite, :image, location_ids:[], category_ids:[])
    end

    def can_edit_course?
      unless @course.user.id == current_user.id
        render "forbidden"
      end
    end
end
