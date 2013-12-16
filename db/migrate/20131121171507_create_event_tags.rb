class CreateEventTags < ActiveRecord::Migration
  def change
    create_table :event_tags do |t|

      t.timestamps
    end
  end
end
