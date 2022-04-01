class CreateCheatings < ActiveRecord::Migration[5.2]
  def change
    create_table :cheatings do |t|

      t.timestamps
    end
  end
end
