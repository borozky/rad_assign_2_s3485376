class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :vote, :reset_votes]
  before_action :authorize, except: [:index, :show]
  before_action :can_edit_course?, only: [:edit, :update]
  before_action :authorize_admin, only: [:reset_votes, :destroy]
  
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
    @vote.voter = current_user
    @vote.course = @course
    @vote.thumbs_up = params[:vote]

    if @vote.save
      flash[:success] = "Successfully voted for this course"
      redirect_to :back
    else
      flash[:danger] = @vote.errors.values.first.join(',')
      redirect_to :back
    end

  end
  
  def reset_votes
    
    @course.vote_resets += 1
    @course.last_vote_reset = Time.now

    respond_to do |format|
      if @course.save
        flash[:success] = "Votes for this course has successfully reset"
        format.html { redirect_to @course }
      else
        
        flash[:danger] = "Votes for this course failed to reset"
        format.html { render :new }
      end
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
        flash[:success] = "Course successfully created" 
        format.html { redirect_to @course, success: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        flash[:danger] = "Failed to update curse"
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
        flash[:success] = "Course successfully updated"
        format.html { redirect_to @course, success: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        flash[:danger] = "Failed to update course"
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    
    return forbidden if !current_admin
    
    if @course.destroy
      respond_to do |format|
        flash[:success] = "Course successfully deleted"
        format.html { redirect_to courses_url, success: 'Course was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  # no user can delete course

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
      
      # do not assign the result of this filter into @course.vote, else it will make all the course_id of the votes of this course NULL
      @votes = @course.votes.select do |vote|
        vote.created_at > @course.last_vote_reset
      end
      
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :prerequisite, :image, location_ids:[], category_ids:[])
    end

    def can_edit_course?
      if current_admin
        return true
      end
      
      unless @course.user.id == current_user.id
        render "forbidden"
      end
    end
    
    def can_delete_course?
       return true if current_admin
    end
end
