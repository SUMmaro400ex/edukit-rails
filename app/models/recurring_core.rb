# RecurringCore is a library that should be written in a fashion where any active record
# object should be able to recur.

module RecurringCore

  def self.included(base)
    base.send(:extend, RecurringLogic)

    base.send(:scope, :all_in_range, -> (start_date, end_date){
      base.recurrence
    })
  end


  def recurrence_sql
      %{
        (
          recurrences.repeat_pattern = 'W'
          AND (recurrences.week_day_mask & cast(pow(2,#{week_day}) as integer)) = cast(pow(2,#{week_day}) as integer)
          AND ((CAST(date('#{week_start}') - (date(recurrences.start_date) - CAST(EXTRACT(DOW FROM date(recurrences.start_date)) AS integer)) AS integer)/7)%recurrences.interval) = 0
        )
        OR
        (
          recurrences.frequency_code = 'M'
          AND recurrences.month_day IS NOT NULL
          AND recurrences.month_day >= 0
          AND recurrences.month_day = #{end_date}
          AND #{monthly_interval_sql(month_start)}
        )
        OR
        (
          recurrences.frequency_code = 'M'
          AND recurrences.month_day IS NOT NULL
          AND recurrences.month_day < 0
          AND #{end_date} = date_part('day', date('#{month_end}') + recurrences.month_day + 1)
          AND #{monthly_interval_sql(month_start)}
        )
        OR
        (
          recurrences.frequency_code = 'M'
          AND recurrences.month_day IS NULL
          AND recurrences.day_position IS NOT NULL
          AND (cast(recurrences.bin_day as integer) & cast(pow(2,#{week_day}) as integer)) = cast(pow(2,#{week_day}) as integer
        )

      }
  end

  module RecurringLogic

  end

end
