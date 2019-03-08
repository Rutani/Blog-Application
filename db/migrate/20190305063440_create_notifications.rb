class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :notifiable, polymorphic: true, index: true
      t.references :user, foreign_key: true
      t.references :blog, foreign_key: true

      t.timestamps

    end
  end
end
