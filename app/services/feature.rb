# frozen_string_literal: true

class Feature
  class << self
    # Load config file
    #
    # @param file [String]
    # @param env [String]
    def load(file, env = 'development')
      @settings = YAML.safe_load(File.read(file))
      @env = env
    end

    # Method missing hook
    #
    # @param m [Symbol]
    # @param args [Mixed]
    # @param block [Proc]
    # @return [Boolean]
    def method_missing(method, *_args)
      method = method.to_s
      param = prepare(method)

      return @settings[@env][param] = true if method.end_with?('_on!')
      return @settings[@env][param] = false if method.end_with?('_off!')
      res = @settings[@env].fetch(param, nil)
      return res unless res.nil?
      super
    end

    # Correct respond to missing
    #
    # @param method [Symbol]
    # @param include_private [Boolean]
    # @return [Boolean]
    def respond_to_missing?(method, include_private = false)
      method = method.to_s
      param = prepare(method)
      @settings[@env].fetch(param, nil) || super
    end

    # Cleanup and Prepare param name
    #
    # @param param [String]
    # @return [String]
    def prepare(param)
      param.gsub(/_on\!|_off\!|\?|_enabled\?/, '')
    end
  end
end
