class LinePresenter
  attr_reader :line
  def initialize(line)
    @line = line
  end

  def to_json
    {
      id: line.id.to_s,
      body: line.body_parts
    }
  end
end