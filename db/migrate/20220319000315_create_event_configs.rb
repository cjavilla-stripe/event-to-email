class CreateEventConfigs < ActiveRecord::Migration[7.1]
  def change
    create_table :event_configs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :email
      t.string :event_type

      t.timestamps
    end
  end
end
