require 'rails_helper'

RSpec.describe Food, type: :model do
    describe "Validations" do
        it { should validate_presence_of :name }
        it { should validate_presence_of :category }
    end

    describe "relationships" do
        it { should belong_to :cabinet}
        it { should belong_to :refridgerator}
        it { should belong_to :freezer}
        it { should belong_to :miscellaneous}
    end
end