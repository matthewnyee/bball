class ResetStatusesJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    User.update_all(status: :reset_statuses_job_file)
    #User.save
  end

  ResetStatusesJob.perform_later
end
