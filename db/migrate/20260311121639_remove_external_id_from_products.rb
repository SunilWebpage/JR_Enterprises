class RemoveExternalIdFromProducts < ActiveRecord::Migration[8.1]
  def change
    remove_column :products, :external_id, :string
  end
end
