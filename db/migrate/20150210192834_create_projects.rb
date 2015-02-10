class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :status
      t.string :level

      t.timestamps
    end
  end
end
