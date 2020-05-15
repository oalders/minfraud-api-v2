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

require 'maxmind/geoip2/record/continent'
require 'maxmind/geoip2/record/country'
require 'maxmind/geoip2/record/maxmind'
require 'maxmind/geoip2/record/represented_country'
require 'maxmind/geoip2/record/traits'

module MaxMind
  module GeoIP2
    module Model
      # Model class for the data returned by the GeoIP2 Country web service and
      # database. It is also used for GeoLite2 Country lookups.
      class Country
        # Continent data for the IP address.
        #
        # @return [MaxMind::GeoIP2::Record::Continent]
        attr_reader :continent

        # Country data for the IP address. This object represents the country where
        # MaxMind believes the end user is located.
        #
        # @return [MaxMind::GeoIP2::Record::Country]
        attr_reader :country

        # Data related to your MaxMind account.
        #
        # @return [MaxMind::GeoIP2::Record::MaxMind]
        attr_reader :maxmind

        # Registered country data for the IP address. This record represents the
        # country where the ISP has registered a given IP block and may differ from
        # the user's country.
        #
        # @return [MaxMind::GeoIP2::Record::Country]
        attr_reader :registered_country

        # Represented country data for the IP address. The represented country is
        # used for things like military bases. It is only present when the
        # represented country differs from the country.
        #
        # @return [MaxMind::GeoIP2::Record::RepresentedCountry]
        attr_reader :represented_country

        # Data for the traits of the IP address.
        #
        # @return [MaxMind::GeoIP2::Record::Traits]
        attr_reader :traits

        # @!visibility private
        def initialize(record, locales)
          @continent = MaxMind::GeoIP2::Record::Continent.new(
            record['continent'],
            locales,
          )
          @country = MaxMind::GeoIP2::Record::Country.new(
            record['country'],
            locales,
          )
          @maxmind = MaxMind::GeoIP2::Record::MaxMind.new(record['maxmind'])
          @registered_country = MaxMind::GeoIP2::Record::Country.new(
            record['registered_country'],
            locales,
          )
          @represented_country = MaxMind::GeoIP2::Record::RepresentedCountry.new(
            record['represented_country'],
            locales,
          )
          @traits = MaxMind::GeoIP2::Record::Traits.new(record['traits'])
        end
      end
    end
  end
end
