class LimitedArray

  attr_accessor :limit, :storage

  def initialize(limit, storage = {})
    @limit, @storage = limit, storage
  end


  def get(idx)
    self.check_limit(idx)
    @storage[idx]
  end

  def set(idx, value)
    self.check_limit(idx)
    @storage[idx] = value
  end

  def each
    @storage.each_with_index do |item, i|
      Proc.new do |storage|
        storage = @storage
        return storage[i], i, storage
      end
    end
  end

  def check_limit(idx)
    if idx.class != Fixnum
      raise "Setter requires a numeric index for its first argument"
    end

    if @limit <= idx
      raise "Error trying to access an over-the-limit index"
    end

    self
  end

end
