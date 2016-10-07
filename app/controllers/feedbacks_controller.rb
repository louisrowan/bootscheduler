class FeedbacksController < ApplicationController

  def index
    @feedbacks = Feedback.all
    # redirect_to boot_path(current_user)
  end

  def new
<<<<<<< HEAD
    @boot = Boot.find(params[:boot_id])
=======
    @boot = Boot.find(  params[:boot_id])
>>>>>>> 818d68457e452bc0adaf930a3d0abe6bd7772c2a
    @feedback = Feedback.new
  end

  def create
    @boot = Boot.find(params[:boot_id])
    @feedback = @boot.feedbacks.new(feedback_params)
    if @feedback.save
      redirect_to boot_path(@boot)
    else
      render 'new'
    end
  end

  def show
    @feedback = Feedback.find(params[:id])
  end
  
  def edit
    @feedback = Feedback.find(params[:id])
  end

  def update
    @boot = Boot.find(params[:boot_id])
    @feedback = Feedback.find(params[:id])
    if @feedback.update(feedback_params)
      # redirect_to boot_feedback_path(@feedback)
      redirect_to boot_path(@boot)
    else
      render 'edit'
    end
  end

  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    redirect_to boot_path(current_user)
  end

  private

  def feedback_params
    params.require(:feedback).permit(:rating, :comment, :ask)
  end
end
