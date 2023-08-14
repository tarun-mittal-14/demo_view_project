class SeekersController < ApplicationController

  def index
    @seekers = Seeker.all
    @jobs = Job.all
  end

  def new
    @seeker =  Seeker.new
  end

  def create
    @seeker = Seeker.create(seeker_params)
    if @seeker.save
       redirect_to @seeker
    else
      render :new
    end
  end

  def show
        @seeker = Seeker.find(params[:id])

    # render json: @current_user
  end

   def edit
        @seeker = Seeker.find(params[:id])

   end

  def update
    # @current_user.update(seeker_params)
     @seeker = Seeker.find(params[:id])
    if @seeker.update(seeker_params)
       redirect_to @seeker
     else
      render :edit
    end
  end

  def search_job
    @job = Job.where("title LIKE '%#{params[:title].strip}%'")
     redirect_to  @job
  end

  # def view_jobs
  #   jobs = Job.all
  #   render json: jobs
  # end

  # def apply_for_job
  #   seeker = @current_user.job_seekers.new(job_id: params[:job_id], status: 'applied')
  #   if seeker.save
  #     render json: { message: 'Applied successful' }
  #   else
  #     render json: { message: 'There is no Job related to this id ' }
  #   end
  # end

  # def view_applied_jobs
  #   applied_jobs = @current_user.job_seekers
  #   render json: applied_jobs
  # end

  private

  def seeker_params
    params.require(:seeker).permit(:name, :email, :password, :age,
      :qualification, :experience)
  end
end
