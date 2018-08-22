class LessonsController < ApplicationController
  before_action :find_lesson, only: [:show, :edit, :update]

  def index
    @lessons = Lesson.all
    @rooms = Room.all

  end

  def show
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to lessons_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @lesson.update(lesson_params)
    if @lesson.save
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
  end

  def destroy
    @lesson.destroy
    redirect_to lessons_path
  end

  private

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:start_time, :user_id, :course_id, :room_id)
  end
end
