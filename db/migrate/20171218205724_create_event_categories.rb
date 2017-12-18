class CreateEventCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :event_categories do |t|
      t.integer :category_id
      t.integer :event_id
    end
  end
end
