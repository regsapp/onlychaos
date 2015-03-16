Admin.create!(email: "admin@example.com", password: "password")

as = YearGroup.create!(name: "AS")
a2 = YearGroup.create!(name: "A2")

astrophysics = Category.create!(name: "Astrophysics", year: "A2")
mechanics = Category.create!(name: "Mechanics", year: "AS")
electricity = Category.create!(name: "Electricity", year: "A2")
particles = Category.create!(name: "Particles", year: "A2")
waves = Category.create!(name: "Waves", year: "AS")

school = School.create(name: "Hogwarts")
school.students.create!(email: "student@example.com", password: "password", first_name: "Harry", last_name: "Potter", birthday: "1981/7/31".to_date)

question = Question.create!(
  description: %q{
    Suppose we have a particle in 1-dimension, with wavefunction $$Ae^{-\frac{|x|}{2d}}$$.
    What is the probability to find the particle in the interval $$[0,d]$$?
    <br>
    Please provide your answer in terms of $$A$$, $$d$$, mathematical constants such as $$\pi$$ (entered as <code>pi</code>) or $$e$$ (entered as <code>e</code>).
    (<b>Assume that A is real</b>)
  }.squish,
  answer_type: "formula",
  marks: 1,
  category_id: astrophysics.id,
  year_group_id: as.id,
  correct_answer_attributes: {
    content: "`A^2+d+pi-e`"
  }
)

year_groups = YearGroup.all.to_a
categories = Category.all.to_a

20.times do ||
  Question.create!(
    description: %{
      Lorem `#{rand(1000)}/#{rand(1000)}` ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.
    }.squish,
    answer_type: "text",
    marks: rand(1..5),
    category_id: categories.sample.id,
    year_group_id: year_groups.sample.id,
    correct_answer_attributes: {
      content: "ipsum dolor"
    }
  )
end
