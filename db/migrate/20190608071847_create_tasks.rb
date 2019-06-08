class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.string :description
      t.integer :status
      t.references :user, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
