require 'faker'

def rn
  rand(9)
end

STATUS = ["detailing", "ready", "question", "releasing", "finished"]

10.times do
  project = Project.create( name: Faker::Address.city,
                  number: "213-#{rn}#{rn}-#{rn}#{rn}")
  (1..20).each do |n|
    project.drawings.create(number: n.to_s, status: STATUS[rand(5)])
  end
end


# (1..20).each do |n|
#   ErectionDrawing.create(number: "E#{4000 + n}", revision: rand(2))
# end
