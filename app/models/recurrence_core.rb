module RecurrenceCore

  ONCE    = 'ONCE'.freeze
  WEEKLY  = 'WEEKLY'.freeze
  MONTHLY = 'MONTHLY'.freeze
  YEARLY  = 'YEARLY'.freeze

  def self.included(base)
     check_recurrence_attribute(base)
     base.send(:extend,ClassMethods)
  end

  def self.check_recurrence_attribute(base)
    begin
      base.new.recurrences_id
    rescue => e
      raise NoMethodError, "Model must have recurrence_id column"
    end
    nil
  end

  module ClassMethods
    def get_all_in_range(start_date,end_date,options)
      OccurrenceSearcher.get_all_in_range_of_type(self,start_date,end_date,options)
    end
  end

  class OccurrenceSearcher

    attr_reader :recurring_class, :start_date, :end_date

    def initialize(recurring_class,start_date,end_date)
      @recurring_class = recurring_class
      @start_date = start_date
      @end_date = end_date || Date.today + 1.month
    end

    def self.get_all_in_range_of_type(klass,start_date,end_date,options)
      new(klass,start_date,end_date).get_all_in_range_of_type(options)
    end

    def get_all_in_range_of_type(options)
      recurring_class.includes(:recurrences).where(where_sql)
    end

    private

    def where_sql
      %{
        #{date_range_sql}
        AND
          (
            #{date_mask_sql}
          )
      }
    end

    def date_range_sql
      %{
        (recurrences.start_date, recurrences.end_date) OVERLAPS (date('#{start_date}'), date('#{end_date}'))
      }
    end

  end
end
