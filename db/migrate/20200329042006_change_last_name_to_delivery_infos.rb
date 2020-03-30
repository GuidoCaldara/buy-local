class ChangeLastNameToDeliveryInfos < ActiveRecord::Migration[6.0]
  def change
    rename_column :delivery_infos, :las_name, :last_name
  end
end
