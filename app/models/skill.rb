class Skill < ApplicationRecord

  # Skill link between parent & children
  belongs_to              :parent,    class: 'Skill'
  has_many                :children,  class: 'Skill', foreign_key: 'parent_id'


  has_and_belongs_to_many :users

end