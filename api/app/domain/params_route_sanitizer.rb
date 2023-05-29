# frozen_string_literal: true

class ParamsRouteSanitizer
  def self.sanitize(params)
    params[:comments] = '' if params[:comments].nil?
    clean_params = ActiveRecord::Base.sanitize_sql(params)

    {
      difficult_level: clean_params[:difficult_level].gsub(/\s+/, ''),
      climbing_time: clean_params[:climbing_time].to_i,
      comments: clean_params[:comments].strip
    }
  end
end
