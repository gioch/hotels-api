require 'ffaker'

FactoryGirl.define do
  sequence :name do
    rand(2..5).times.map { FFaker::Lorem.word }.join(' ')
  end

  sequence :address do
    rand(2..5).times.map { FFaker::Lorem.word }.join(' ')
  end

  sequence :star_rating do
    rand(2..5)
  end
end
