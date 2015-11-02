# REVIEW 
describe Review do
#has all attributes
  [:id, :user_id, :school_id, :title, :description, :rating].each do |prop|
    it {is_expected.to respond_to prop}
  end
  [:title, :description, :rating].each do |prop|
    it {is_expected.to validate_presence_of prop}
  end
#rating initial value
  # it {is_expected.to be(nil)} NEED TO SPECIFY RATING FIELD
#should belong to user
  it {is_expected.to belong_to :user}
#has many records
  it {is_expected.to have_many :records}
#has many schools through records
  it {is_expected.to have_many(:schools).through(:records)}
end