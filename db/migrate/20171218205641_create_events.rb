class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.text :short_description
      t.integer :owner_id
      t.date :date
      t.time :time
      t.text :additional_info
    end
  end
end
