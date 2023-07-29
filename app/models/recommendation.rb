class Recommendation < ApplicationRecord
    belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_email', primary_key: 'email'
    belongs_to :recommender, class_name: 'User', foreign_key: 'recommender_email', primary_key: 'email'

    validate :validate_receiver_email_existence

    def validate_receiver_email_existence
      return unless receiver_email.present?
      errors.add(:receiver_email, 'must belong to an existing student') unless User.exists?(email: receiver_email)
    end
  end