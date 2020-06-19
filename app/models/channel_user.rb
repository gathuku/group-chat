# frozen_string_literal: true

class ChannelUser < ApplicationRecord
  belongs_to :channel
  belongs_to :user
end
