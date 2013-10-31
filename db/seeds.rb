
(1..20).each do |n|
  ErectionDrawing.create(number: "E#{4000 + n}", revision: rand(2))
end
