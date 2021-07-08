class CreateMitumoriImages < ActiveRecord::Migration[5.2]
  def change
    create_table :mitumori_images do |t|
      t.string :genba_name
      t.string :image
      t.timestamps
    end
  end
end
