class AddCompanyIdToCarParks < ActiveRecord::Migration
  def change
    add_column :car_parks, :company_id, :integer
  end
end
