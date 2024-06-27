class LessonsController < ApplicationController
    before_action :set_course, only: [:index, :new, :create]
    before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  
    def index
      @lessons = @course.lessons
    end
  
    def show
    end
  
    def new
      @lesson = Lesson.new
    end
  
    def create
      @lesson = @course.lessons.build(lesson_params)
      if @lesson.save
        redirect_to course_lesson_path(@course, @lesson), notice: 'Lesson was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @lesson.update(lesson_params)
        redirect_to course_lesson_path(@lesson.course, @lesson), notice: 'Lesson was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @lesson.destroy
      redirect_to course_lessons_path(@lesson.course), notice: 'Lesson was successfully destroyed.'
    end
  
    private
  
    def set_course
      @course = Course.find(params[:course_id])
    end
  
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end
  
    def lesson_params
      params.require(:lesson).permit(:title, :content, :course_id, :video)
    end
  end
  