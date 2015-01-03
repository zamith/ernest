require 'yaml'

module Ernest
  Data = Struct.new(:metadata, :output)

  class MetadataParser
    attr_reader :text, :metadata

    def initialize(text)
      @text = text
      @metadata = {}
    end

    def parse
      if @text =~ /^(---\s*\n.*?\n?^---\s*$\n?)/m
        @metadata = YAML.load($1)
        @text.sub!($1, '')
      end
      Data.new(metadata, text)
    end
  end
end
