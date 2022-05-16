class Admin::HelloworldJobsController < Admin::AdminController

  def create
    authorize! :admin
    HelloWorldJob.perform_later
    redirect_to admin_helloworld_job_path
  end

  def show
    authorize! :admin
  end

end
