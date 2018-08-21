class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
    find_lesson
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

    private

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end

end
