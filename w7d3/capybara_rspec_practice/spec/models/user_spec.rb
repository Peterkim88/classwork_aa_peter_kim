require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    # let(:incomplete_user){User.new(username: '', email: 'email@aa.com', password: 'email')}
    # it 'validates presence of a username' do
    #   expect(incomplete_user).to_not be valid
    # end
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:coding_affiliation)}
    it {should validate_length_of(:password).is_at_least(6)}

    it {should validate_uniqueness_of(:username)}

    subject(:banana) {User.create(
      username: 'banana',
      email: 'banana@gmail.com',
      age: 5,
      password: 'password',
      coding_affiliation: 'Ruby'
    )
    }
  end
end
