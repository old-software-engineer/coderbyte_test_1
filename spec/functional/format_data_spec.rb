require 'spec_helper'
RSpec.describe 'Format data' do
  describe 'format data by split type, date format, data and type' do
    let(:params) do
      {}
    end
    let(:people_controller) { PeopleController.new(params) }
    it 'parses inputs and outputs formatted data' do
      format_data = people_controller.format_data(' % ', '%Y-%m-%d', 'Mckayla % Atlanta % 1986-05-29', 'percent')
      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(format_data).to eq  'Mckayla, Atlanta, 5/29/1986'
    end
  end
end