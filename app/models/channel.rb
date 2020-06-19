# frozen_string_literal: true

class Channel < ApplicationRecord
  has_many :channel_users
  has_many :messages

  validate :name, presence: true
end
