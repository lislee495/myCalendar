class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :short_description
      t.integer :owner_id
      t.date :date
      t.datetime :time 
    end
  end
end
