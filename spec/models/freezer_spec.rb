require 'rails_helper'

RSpec.describe Freezer, type: :model do
    describe "relationships" do
        it { should have_many :foods}
    end
end