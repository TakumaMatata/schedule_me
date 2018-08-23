class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = policy_scope(Student)
  end

  def show
     authorize @student
  end

  def new
    @student = Student.new
    authorize @student
  end

  def create
    @student = Student.new(student_params)
    authorize @student
    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  def edit
    authorize @student
  end

  def update
    @student.update(student_params)
    # @student = Student.update(student_params)
    authorize @student
      if @student.save
        redirect_to student_path(@student)
      else
        render :new
      end
  end

  def destroy
    @student.destroy
    authorize @student
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
