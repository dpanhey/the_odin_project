# frozen_string_literal: true

require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0').slice(0..4)
end

def clean_phone_number(phone_number)
  case phone_number.tr('^0-9', '').length
  when 10
    phone_number.tr('^0-9', '')
  when 11
    phone_number.tr('^0-9', '').slice(1..10) if phone_number.tr('^0-9', '').start_with?('1')
  end
end

def legislator_by_zipcode(zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  civic_info.representative_info_by_address(
    address: zipcode,
    levels: 'country',
    roles: %w[legislatorUpperBody legislatorLowerBody]
  ).officials
rescue StandardError
  'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
end

def form_letter_file_generation(id, name, legislators)
  Dir.mkdir('output') unless Dir.exist?('output')

  File.open("output/thanks_letter#{id}.html", 'w') do |file|
    file.puts (ERB.new File.read 'lib/form_letter.erb').result(binding)
  end
end

def parse_registration_time(reg_date)
  Time.strptime(reg_date, '%m/%d/%y %k:%M')
end

puts 'Event Manager Initialized!'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

valid_phone_numbers = []
registration_hours = Hash.new(0)

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  phone_number = row[:homephone]
  reg_date = row[:regdate]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislator_by_zipcode(zipcode)
  form_letter_file_generation(id, name, legislators)

  valid_phone_numbers << clean_phone_number(phone_number) unless clean_phone_number(phone_number).nil?
  registration_hours[parse_registration_time(reg_date).hour] += 1
end

p "Most used Registration Time: #{(registration_hours.max_by { |_hour, value| value })[0]}h "\
  "with #{(registration_hours.max_by { |_hour, value| value })[1]} registrations."

puts 'Event Manager Script Successful!'
