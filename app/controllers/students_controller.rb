class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    set_student
  end

  def activate
    @student = set_student
    if @student.active == false
      @student.active = true
    else
      @student.active == true
      @student.active = false
    end
    @student.save
    
    redirect_to student_path(@student)
  end



  private

    def set_student
      @student = Student.find(params[:id])
    end


end
