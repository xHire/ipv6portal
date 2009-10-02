module ActiveRecord
  module ConnectionAdapters # :nodoc:
    module SchemaStatements
      def add_column(table_name, column_name, type, options = {})
        add_column_sql = "ALTER TABLE #{quote_table_name(table_name)} ADD #{quote_column_name(column_name)} #{type_to_sql(type, options[:limit], options[:precision], options[:scale])}"
        add_column_options!(add_column_sql, options)
        add_column_sql += " AFTER #{quote_column_name(options[:after])}" if options[:after]
        execute(add_column_sql)
      end
    end
  end
end
