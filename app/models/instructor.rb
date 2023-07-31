class Instructor < ApplicationRecord
    belongs_to :meeting, foreign_key: :class_number
  end