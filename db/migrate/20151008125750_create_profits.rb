class CreateProfits < ActiveRecord::Migration
  def change
    create_table :profits do |t|
      t.string :option
      t.date :date

      t.timestamps 
    end
  end
end
