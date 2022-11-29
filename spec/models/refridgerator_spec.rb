require 'rails_helper'

RSpec.describe Refridgerator, type: :model do
    describe "relationships" do
        it { should have_many :foods}
    end
end