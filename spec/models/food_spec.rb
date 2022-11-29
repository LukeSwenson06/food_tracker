require 'rails_helper'

RSpec.describe Food, type: :model do
    describe "Validations" do
        it { should validate_presence_of :name }
        it { should validate_presence_of :category }
    end

    describe "relationships" do
        it { should have_many :cabinets}
        it { should have_many :refridgerators}
        it { should have_many :freezers}
        it { should have_many :others}
    end
end