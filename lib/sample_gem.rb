require "sample_gem/version"

module SampleGem
  class Error < StandardError; end

  class SampleClass

    def self.sample_method
      p 'sample_method!!'
    end
  end
end
