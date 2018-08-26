class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @classroom = Classroom.first 
    @student = Student.new(student_params)
    @student.name = params [:name]
    @student.birthday = params[:birthday]
    @student.hometown - params[:hometown]
    @student.classroom_id = @classroom.id
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
    @student = @student.classroom 
  end

  def index
    @students = Student.all
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
