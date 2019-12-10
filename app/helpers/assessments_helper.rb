module AssessmentsHelper
  def replace_nil(assess)
    return 0 if assess.nil?
    return assess
  end

  def replace_icon(assess)
    if assess == "good"
      return "fa-grin-squint"
    elsif assess == "normal"
      return "fa-meh-blank"
    else
      return "fa-sad-tear"
    end
  end
end
