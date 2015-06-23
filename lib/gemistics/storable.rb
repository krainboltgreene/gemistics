class Gemistics
  module Storable
    private

    def database
      Gemistics.db
    end

    def stored?
      database.key?(database_key)
    end

    def set
      database.store(database_key, raw)
    end

    def get
      database.load(database_key)
    end
  end
end
