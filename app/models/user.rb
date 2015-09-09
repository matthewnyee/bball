class User < ActiveRecord::Base

  def perform
      User.update_all(status: :user_model_file1)
      #User.save
  end

  def reset_statuses
    User.update_all(status: :user_model_file2)
  end

    #Crono.perform(User).every 5.seconds
end
