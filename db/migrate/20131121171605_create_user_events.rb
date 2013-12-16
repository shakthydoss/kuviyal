class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|

      t.timestamps
    end
  end
end
