class LessonsController < ApplicationController
  before_action :find_lesson, only: [:show, :edit, :update]

  def index
    @lessons = lesson.all
  end

  def show
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to user_lessons_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @lesson = Lesson.update(lesson_params)
    if @lesson.save
      redirect_to user_lesson_path(@lesson)
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
    params.require(:lesson).permit(:start_time)
  end
end
