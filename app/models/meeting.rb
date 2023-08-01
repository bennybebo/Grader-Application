class Meeting < ApplicationRecord
    belongs_to :section, foreign_key: :class_number
    has_many :instructors, foreign_key: :class_number, dependent: :destroy
end