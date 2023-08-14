class RecruitersController < ApplicationController

  def new
  end

  def create
    @recruiter = Recruiter.new(recruiter_params)
    if @recruiter.save
      render json: @recruiter
    else
      render json: @recruiter.errors.full_messages
    end
  end

  def show
    # render json: @current_user
  end

  def edit
  end

  def update
    @current_user.update(recruiter_params)
    render json: { message: 'successfully updated' }
  end

  private

  def recruiter_params
    params.permit(:name, :email, :password, :age, :experience, :qualification, :image)
  end
end
