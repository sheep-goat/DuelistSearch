module AssessmentsHelper
  def replace_nil(assess)
    return 0 if assess.nil?
    return assess
  end
end
