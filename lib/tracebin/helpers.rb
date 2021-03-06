module Tracebin
  module Helpers
    def to_milliseconds(time)
      time.to_f * 1000
    end

    def time_to_string(time)
      time.is_a?(String) ? time : time.in_time_zone('UTC').iso8601(6)
    end

    def timestamp_string
      Time.now.in_time_zone('UTC').iso8601 6
    end

    def deserialize_time_string(str)
      Time.parse(str).in_time_zone('UTC')
    end

    def milliseconds_between(time1, time2)
      time1 = deserialize_time_string(time1) if time1.is_a?(String)
      time2 = deserialize_time_string(time2) if time2.is_a?(String)

      to_milliseconds(time1 - time2).abs
    end
  end
end

module Tracebin
  class PatchHelper
    class << self
      include ::Tracebin::Helpers
    end
  end
end
