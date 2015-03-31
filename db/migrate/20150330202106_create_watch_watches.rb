class CreateWatchWatches < ActiveRecord::Migration
  def change
    create_table :watch_watches do |t|
      t.references :watcher,   polymorphic: true, index: true
      t.references :watchable, polymorphic: true, index: true 

      t.timestamps null: false
    end

    add_index :watch_watches, [:watcher_id, :watcher_type, :watchable_id, :watchable_type], unique: true, name: 'uniq_watches'
  end
end
