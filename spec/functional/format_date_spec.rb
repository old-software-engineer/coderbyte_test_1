require 'spec_helper'
RSpec.describe 'App Format Date Test' do
  describe 'format date by given format' do
    let(:params) do
      {}
    end
    let(:people_controller) { PeopleController.new(params) }
    it 'parses inputs and outputs formatted date' do
      format_date = people_controller.format_date('1947-05-04', '%Y-%m-%d')
      # Expected format of each string: `<birthdate M/D/YYYY>`
      expect(format_date).to eq  '5/4/1947'
    end
  end
end