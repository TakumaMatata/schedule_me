class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    find_student
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  def edit
    find_student
  end

  def update
    find_student
    @student = Student.update(student_params)
      if @student.save
        redirect_to student_path(@student)
      else
        render :new
      end
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :birth_date, :category, :description)
  end
end
