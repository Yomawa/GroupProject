require 'rails_helper'

  describe School do

    it{is_expected.to validate_uniqueness_of :name}
    it{is_expected.to have_many(:reviews).dependent(:destroy) }

    [:name, :webpage, :logo, :address, :description].each do |prop|
    it {is_expected.to respond_to prop}
    it {is_expected.to validate_presence_of prop}
  end
end