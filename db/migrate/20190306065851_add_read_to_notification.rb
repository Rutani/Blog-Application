class AddReadToNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :read, :Boolean
  end
end
