class PeopleController
  require 'date'

  def initialize(params)
    @params = params
  end

  def normalize
    percent_array = @params[:percent_format].split("\n")
    dollar_array = @params[:dollar_format].split("\n")
    normalize_array = []
    percent_array.zip(dollar_array).each_with_index do |data, index|
      next if index == 0

      normalize_array.push(format_data(' % ', '%Y-%m-%d', data[0], 'percent'))
      normalize_array.push(format_data(' $ ', '%d-%m-%Y', data[1], 'dollar'))
    end
    normalize_array.sort { |a, b| a[0] <=> b[0] }
  end

  def format_data(split_with, date_format, data, type)
    array_output = data.split(split_with)
    if type == 'percent'
      string = array_output[0] + ', ' + array_output[1] + ', ' + format_date(array_output[2], date_format)
    else
      string = array_output[3] + ', ' + (array_output[0] == 'LA' ? 'Los Angeles' : 'New York City') + ', ' + format_date(array_output[1], date_format)
    end
    string
  end

  def format_date(date, date_format)
    formatted_date = Date.strptime(date, date_format)
    formatted_date.strftime('%-m/%-d/%Y')
  end

  private
  attr_reader :params
end
