class GoalsController < ApplicationController

  before_action :require_logged_in


  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to goal_url(@goal.id)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def new
    @goal = Goal.new
    render :new
  end

  def show
    @goal = Goal.find(params[:id])
    if @goal.private
      redirect_to user_url(@goal.user.id) unless @goal.user.id == current_user.id
    end
  end

  def update

  end

  def delete

  end

  private

  def goal_params
    params.require(:goal).permit(:title, :details, :private, :completed)
  end

end
