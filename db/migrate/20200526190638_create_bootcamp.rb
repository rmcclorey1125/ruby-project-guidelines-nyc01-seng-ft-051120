class CreateBootcamp < ActiveRecord::Migration[5.0]
  def change
    create_table :bootcamps do |t|
      t.integer :student_id
      t.integer :teacher_id
    end
  end
end
