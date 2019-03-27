require 'rails_helper'

describe Insurance do

  before(:all) do 
    @provider  = create(:provider)
    @user      = create(:user)
    @profile   = create(:profile, user_id: @user.id ) 
  end

  it "exists" do
    attributes = {
      insurance_type: "medical",
      carrier: "Aetna",
      id_number: "abc123",
      group_number: "def456",
      phone_number: "800-111-1111",
      profile_id: @profile.id
    }
    insurance = Insurance.create(attributes)
    expect(insurance).to be_a(Insurance)
    expect(Insurance.last).to eq(insurance)
  end

  it "does not create a duplicate record" do
    attributes = {
      insurance_type: "medical",
      carrier: "Aetna",
      id_number: "abc123",
      group_number: "def456",
      phone_number: "800-111-1111",
      profile_id: @profile.id
    }
    attributes2 = {
      insurance_type: "dental",
      carrier: "Aetna",
      id_number: "den123",
      group_number: "def456",
      phone_number: "800-111-1111",
      profile_id: @profile.id
    }
    Insurance.create(attributes)
    Insurance.create(attributes)
    Insurance.create(attributes2)

    expect(Insurance.count).to eq(2)
  end

end