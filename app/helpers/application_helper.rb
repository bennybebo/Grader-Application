module ApplicationHelper
    def meeting_day_string(meeting)
        days = []
        days << "Monday" if meeting.monday
        days << "Tuesday" if meeting.tuesday
        days << "Wednesday" if meeting.wednesday
        days << "Thursday" if meeting.thursday
        days << "Friday" if meeting.friday
        days << "Saturday" if meeting.saturday
        days << "Sunday" if meeting.sunday
        days.join(", ")
      end

      def formatted_time_range(start_time, end_time)
        "#{format_time(start_time)} - #{format_time(end_time)}"
      end
    
      def format_time(time)
        time.strftime('%I:%M %p')
      end
end
