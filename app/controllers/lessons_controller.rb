class LessonsController < ApplicationController
  before_action :find_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = policy_scope(Lesson)
    @rooms = Room.all
    @user = current_user
  end

  def show
    authorize @lesson
    # @enrollments = @lesson.enrollments
    @memo = Memo.new

    # Passing the instance variable of the enrollment and new memo
  end

  def new
    if params[:room_id]
      @lesson = Lesson.new(room_id: params[:room_id], start_time: params[:start_time])
      authorize @lesson
    else
      @lesson = Lesson.new
      authorize @lesson
    end
  end

  def create
    if params[:recurring_check][:recurring]
      @lesson = Lesson.new(lesson_params)
      authorize @lesson
      if @lesson.save
        @lesson.add_students(params[:students]) if params[:students]
        start_time = @lesson.start_time
        (params[:recurring_check][:weeks].to_i-1).times do
          start_time = start_time + 7.days
          new_lesson = Lesson.new(lesson_params)
          new_lesson.start_time = start_time
          authorize new_lesson
          new_lesson.save
        end
        redirect_to lessons_path
      else
        render :new
      end
    else
      @lesson = Lesson.new(lesson_params)
      authorize @lesson
      if @lesson.save
        @lesson.add_students(params[:students]) if params[:students]
        redirect_to lessons_path
      else
        render :new
      end
    end
  end

  def edit
    authorize @lesson
  end

  def update
    @lesson.update(lesson_params)
    authorize @lesson
    if @lesson.save
      @lesson.add_students(params[:students]) if params[:students]
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
  end

  def destroy
    @lesson.destroy
    authorize @lesson
    redirect_to lessons_path
  end

  private

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:start_time, :user_id, :course_id, :room_id, :students, :comment)
  end
end
