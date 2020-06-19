# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  validates :body, presence: true
end
