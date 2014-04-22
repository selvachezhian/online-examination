class User
  include Mongoid::Document
  include Mongoid::Timestamps

  include RandomRecord

  # Fields
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :age, type: Integer

  # Validations
  validates :first_name, :last_name, :email, :random, presence: true
  validates :email, uniqueness: true
end
