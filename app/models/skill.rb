class Skill < ApplicationRecord

  # Skill link between parent & children
  belongs_to              :parent,    class_name: 'Skill', optional: true
  has_many                :children,  class_name: 'Skill', foreign_key: 'parent_id'

  has_and_belongs_to_many :users

end