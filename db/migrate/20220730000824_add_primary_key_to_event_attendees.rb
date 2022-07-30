class AddPrimaryKeyToEventAttendees < ActiveRecord::Migration[7.0]
  def change
    add_column :event_attendees, :id, :primary_key
  end
end
