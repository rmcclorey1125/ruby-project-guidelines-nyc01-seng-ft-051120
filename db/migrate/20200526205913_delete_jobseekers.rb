class DeleteJobseekers < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :job_seeker
  end
end
