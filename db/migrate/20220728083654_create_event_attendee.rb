class CreateEventAttendee < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendees, id: false do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.timestamps
    end
  end
end
