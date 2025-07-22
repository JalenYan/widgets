require "active_record/connection_adapters/postgresql_adapter"

# When we write code like t.timestamps or t.datetime,
# Rails will use TIMESTAMP WITH TIME ZONE and all of our timestamps will be stored
# without ambiguityor implicit dependence on the system time zone.
ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.datetime_type = :timestamptz
