# Copyright (c) 2020 by MaxMind, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# frozen_string_literal: true

require 'maxmind/geoip2/record/place'

module MaxMind
  module GeoIP2
    module Record
      # Contains data for the continent record associated with an IP address.
      #
      # This record is returned by all location services and databases.
      #
      # See {MaxMind::GeoIP2::Record::Place} for inherited methods.
      class Continent < Place
        # A two character continent code like "NA" (North America) or "OC"
        # (Oceania). This attribute is returned by all location services and
        # databases.
        #
        # @return [String, nil]
        def code
          get('code')
        end

        # The GeoName ID for the continent. This attribute is returned by all
        # location services and databases.
        #
        # @return [String, nil]
        def geoname_id
          get('geoname_id')
        end

        # A Hash where the keys are locale codes and the values are names. This
        # attribute is returned by all location services and databases.
        #
        # @return [Hash<String, String>, nil]
        def names
          get('names')
        end
      end
    end
  end
end
