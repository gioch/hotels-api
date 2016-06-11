require 'ffaker'

FactoryGirl.define do
  sequence :name do
    rand(2..5).times.map { FFaker::Lorem.word }.join(' ')
  end
end
