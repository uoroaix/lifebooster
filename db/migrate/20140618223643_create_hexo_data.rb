class CreateHexoData < ActiveRecord::Migration
  def change
    create_table :hexo_data do |t|
      t.integer :dataid
      t.string :info
      t.string :name
      t.string :resource_uri

      t.timestamps
    end
  end
end
