require "yaml"

module Dictionary
  def self.words
    filename = File.join(File.dirname(__FILE__), "words.yaml")
    YAML.load_file(filename)
  end
end
