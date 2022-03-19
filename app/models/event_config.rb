# == Schema Information
#
# Table name: event_configs
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  email      :string
#  event_type :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class EventConfig < ApplicationRecord
  belongs_to :user
end
