class StudentApplication < ApplicationRecord
    belongs_to :section, foreign_key: :class_number
end