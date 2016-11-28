require_relative '../app/models/database.rb'

describe Database do
  it "has a data attribute that stores keys and values" do
    database = Database.new
    database.add_pair("somekey", "somevalue")

    expect(database.data.length).to eq 1
    expect(database.data[:somekey]).to eq "somevalue"
  end
end
