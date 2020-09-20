module KnightsTravails
  class CustomError < StandardError
    def initialize(msg='')
      super(msg)
    end
  end
end
