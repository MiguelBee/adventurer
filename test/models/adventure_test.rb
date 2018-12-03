require 'test_helper'

class AdventureTest < ActiveSupport::TestCase
  test 'is not valid without all of information' do
    a = Adventure.create(title: nil, description: 'This is when we went to the story', str_date: Date.today - 5, end_date: Date.today)
    assert a.errors[:title].any?
    refute a.valid?
  end

  test 'is associated with user' do
    u = FactoryBot.create(:user)
    a = FactoryBot.create(:adventure)
    assert a.user.first_name, 'Miguel'
  end
end
