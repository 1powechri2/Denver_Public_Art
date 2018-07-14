require 'rails_helper'

describe Artwork do
  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:artist)}
  end
end
