class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.date :date
      t.string :location
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
