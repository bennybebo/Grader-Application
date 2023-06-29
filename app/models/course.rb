class Course < ApplicationRecord
    has_many :sections

    validates :course_code, presence: true
    validates :title, presence: true
end
