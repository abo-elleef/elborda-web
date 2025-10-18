class LinePresenter
  attr_reader :line
  def initialize(line)
    @line = line
  end

  def to_json
    {
      id: line.id,
      body: line.body_parts
    }
  end
end