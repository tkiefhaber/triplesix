module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Triplesix"
    end
  end
end
