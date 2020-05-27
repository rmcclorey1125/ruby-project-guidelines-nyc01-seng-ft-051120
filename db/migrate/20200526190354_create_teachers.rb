class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :email
      t.integer :module
      t.string :course
      t.integer :experience
    end
  end
end
