require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "valude validation" do
      it "only allows -1 or 1 as values" do
        expect( v.valid ).to eq( true )
        expect( v2.valid ).to eq( true )
        expect( v3.valid ).to eq( false )
      end
    end
  end
end