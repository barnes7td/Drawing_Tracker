
def rn
  rand(9)
end

cities = %w(Croton Pittsburgh Plainfield Dallas Tampa Jamaica )

STATUS = Drawing::ENGINEERING_STAGE
APPROVAL = Drawing::APPROVAL_STATUSES

cities.length.times do
  footage = rand(100)*10
  project = Project.create( name: cities.pop,
                  number: "213-#{rn}#{rn}-#{rn}#{rn}",
                  footage: footage)
  dr_no = rand(20 + 5)
  (1..dr_no).each do |n|
    project.drawings.create(number: n.to_s,
                            status: STATUS[rand(STATUS.length)],
                            approval_status: APPROVAL[rand(APPROVAL.length)],
                            notes: "Detailed Job",
                            footage: footage/dr_no)
  end
end
puts "(10) Projects created"


# (1..20).each do |n|
#   ErectionDrawing.create(number: "E#{4000 + n}", revision: rand(2))
# end
