class DiscussionsController < ApplicationController
    before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  
    def index
      @discussions = Discussion.all
    end
  
    def show
    end
  
    def new
      @discussion = Discussion.new
    end
  
    def create
      @discussion = Discussion.new(discussion_params)
      if @discussion.save
        redirect_to @discussion, notice: 'Discussion was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @discussion.update(discussion_params)
        redirect_to @discussion, notice: 'Discussion was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @discussion.destroy
      redirect_to discussions_url, notice: 'Discussion was successfully destroyed.'
    end
  
    private
  
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end
  
    def discussion_params
      params.require(:discussion).permit(:content, :user_id, :lesson_id)
    end
  end
  