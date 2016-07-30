class CreateAppraisals < ActiveRecord::Migration
  def change
    create_table :appraisals do |t|
      t.string :name
      t.string :dimensions
      t.string :materials
      t.string :country_of_origin
      t.string :makers_marks
      t.string :damage
      t.string :year_of_manufacture
      t.string :where_was_it_obtained
      t.string :how_was_it_obtained
      t.string :appraiser_number
      t.string :value_of_item
      t.string :historical_significance
      t.string :number_of_pieces_created
      t.string :where_it_was_manufactured
      t.string :when_it_was_used
      t.string :how_it_was_used
      t.integer :selected_plan
      t.integer :status

      t.timestamps
    end
  end
end
