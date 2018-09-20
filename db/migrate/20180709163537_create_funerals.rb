class CreateFunerals < ActiveRecord::Migration[5.2]
  def change
    create_table :funerals do |t|
      t.string :disposition
      t.text :disposition_expand
      t.string :officiant
      t.text :eulogist_expand
      t.string :financial_plan
      t.text :financial_plan_expand
      t.string :service_type
      t.text :service_type_expand
      t.belongs_to :religion, foreign_key: true
      t.text :religion_expand
      t.belongs_to :funeral_home, foreign_key: true
      t.text :funeral_home_expand
      t.text :general_expand

      t.timestamps
    end
  end
end
