require 'rails_helper'

RSpec.describe Refridgerator, type: :model do
    describe "relationships" do
        it { should belong_to :food}
    end
end