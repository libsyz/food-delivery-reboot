require_relative './../models/customer'
require_relative './../models/meal'

class BaseRepository
  def initialize(csv_file_path)
    @next_id = 1
    @csv_file_path = csv_file_path
    @elements = []
    if File.exist?(@csv_file_path)
      load_csv
      @next_id = @elements.last.id + 1
    end
  end

  def create(element)
    # set the id of the element to whatever the element id now
    element.id = @next_id
    # throw the element into the elements
    @elements << element

    # save the element into the csv
    save_to_csv
    # update the next id
    @next_id += 1
  end


  def all
    @elements
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  private

  def save_to_csv
    # do magic again
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << build_row
      # I need to go through all my elements and write them into the csv
      @elements.each do |element|
        csv << build_element(element)
      end
    end
  end

  def load_csv
    # do magic
    csv_options = { headers: true, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row = parse_row(row)
      @elements << self.class.const_get(model_name).new(row) #row contains integers now, diff error please
    end
  end

end
