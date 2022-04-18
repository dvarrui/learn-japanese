
require 'yaml'

class Dictionary
  attr_reader :words

  def initialize()
    filename = File.join(File.dirname(__FILE__), 'data', 'words.yaml')
    @words = YAML.load(File.read(filename))
  end

end
