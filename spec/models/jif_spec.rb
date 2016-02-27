require 'rails_helper'

RSpec.describe Jif, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:jif_path) }
    it { is_expected.to validate_presence_of(:static_path) }
    it { is_expected.to validate_presence_of(:category) }
  end
end
