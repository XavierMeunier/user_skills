class Skill < ApplicationRecord

  # Skill link between parent & children
  belongs_to              :parent,    class_name: 'Skill', optional: true
  has_many                :children,  class_name: 'Skill', foreign_key: 'parent_id'

  has_and_belongs_to_many :users

  validates :name, presence: true, allow_blank: false
  validate :child_depth

private
  def child_depth
    if !parent_id.blank? && !parent.parent.blank?
      errors.add(:parent, "can't be a child of another skill")
    end
  end

end