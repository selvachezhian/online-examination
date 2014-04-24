require 'spec_helper'

describe User do
  before(:each) do
    @user = {
        first_name: 'First Name',
        last_name:  'Last Name',
        age:        '5',
        email:      'valid-email@email.com'
    }
  end

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:age) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:random) }
  it { should validate_uniqueness_of(:email) }

  it 'should create user' do
    User.create!(@user)
    expect(User.count).to eq(1)
  end

  it 'user should have random value between 0 to 1' do
    user = User.create!(@user)
    expect(user.random).to be_between(0, 1)
  end

  it 'user random value should change for each user update' do
    user = User.create!(@user)
    existing_random_value = user.random
    user.update_attribute(:age, 10)
    user.reload
    expect(user.random).not_to eq(existing_random_value)
  end

  it 'user should have random value between 0 to 1 in each user update' do
    user = User.create!(@user)
    user.update_attribute(:age, 10)
    user.reload
    expect(user.random).to be_between(0, 1)
  end
end
