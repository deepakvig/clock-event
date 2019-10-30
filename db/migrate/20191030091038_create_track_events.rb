class CreateTrackEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :track_events do |t|
      t.datetime :time_in
      t.datetime :time_out
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
