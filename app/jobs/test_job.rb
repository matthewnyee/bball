class TestJob < ActiveJob::Base
  def perform
    User.update_all(status: :test_job_rb_file)
    #User.save
  end

  def self.perform
    User.update_all(status: :test_job_rb_fileseptember1)
  end
end
