class ResetStatusesJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    User.update_all(status: :reset_statuses_job_file_ON_MY_BIRTHDAY)
    #User.save
  end

  ResetStatusesJob.perform_later
end
