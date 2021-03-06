CONNECTION = PG.connect :dbname => 'makersbnb_test'

DEFAULT_USER = {
  id: 0,
  username: 'Adam',
  email: 'antman@pop.com',
  password: 'bacon'
}
SECOND_DEFAULT_USER = {
  id: 1,
  username: 'Ben',
  email: 'ben@test.com',
  password: 'password'
}
DEFAULT_SPACE = { id: 0, spacename: 'Pickle Place' }
DEFAULT_BOOKING = {
  id: 0,
  spaceid: DEFAULT_SPACE[:id],
  hirerid: SECOND_DEFAULT_USER[:id],
  start_date: "2018-12-20",
  end_date: "2018-12-23"
}
DEFAULT_AVAILABILITY = {
  id: 0,
  spaceid: DEFAULT_SPACE[:id],
  date: '2019-02-27',
  formatted_date: '27/02/2019'
}
DEFAULT_START_AVAILABILITY = Date.new(2019, 04, 12)
DEFAULT_END_AVAILABILITY = Date.new(2019, 04, 15)

def set_up_database
  clear_database
  populate_database
end

def clear_database
  CONNECTION.exec "TRUNCATE TABLE spaces, users, comments, availability, bookings"
end

def populate_database
  add_default_user
  add_second_default_user
  add_default_space
  add_default_booking
  add_default_availability
end

def add_default_user
  CONNECTION.exec "INSERT INTO users (id, username, email, password)
    VALUES (
      #{DEFAULT_USER[:id]},
      '#{DEFAULT_USER[:username]}',
      '#{DEFAULT_USER[:email]}',
      '#{DEFAULT_USER[:password]}'
    );"
end

def add_second_default_user
  CONNECTION.exec "INSERT INTO users (id, username, email, password)
    VALUES (
      #{SECOND_DEFAULT_USER[:id]},
      '#{SECOND_DEFAULT_USER[:username]}',
      '#{SECOND_DEFAULT_USER[:email]}',
      '#{SECOND_DEFAULT_USER[:password]}'
    );"
end

def add_default_booking
  CONNECTION.exec "INSERT INTO bookings (id, spaceid, hirerid, startdate, enddate)
    VALUES (
      #{DEFAULT_BOOKING[:id]},
      '#{DEFAULT_BOOKING[:spaceid]}',
      '#{DEFAULT_BOOKING[:hirerid]}',
      '#{DEFAULT_BOOKING[:start_date]}',
      '#{DEFAULT_BOOKING[:end_date]}'
    );"
end

def add_default_space
  CONNECTION.exec "INSERT INTO spaces (id, owner, spacename)
    VALUES (
      #{DEFAULT_SPACE[:id]},
      #{DEFAULT_USER[:id]},
      '#{DEFAULT_SPACE[:spacename]}'
    );"
end

def add_default_availability
  CONNECTION.exec "INSERT INTO availability (id, space, availabledate)
    VALUES (
      #{DEFAULT_AVAILABILITY[:id]},
      #{DEFAULT_AVAILABILITY[:spaceid]},
      '#{DEFAULT_AVAILABILITY[:date]}'
    );"
end
