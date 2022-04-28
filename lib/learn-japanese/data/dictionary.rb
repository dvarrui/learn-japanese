
require 'yaml'

module Dictionary

  def self.words
    filename = File.join(File.dirname(__FILE__), 'data', 'words.yaml')
    words = YAML.load(File.read(filename))
  end

end
