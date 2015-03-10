Admin.create!(email: "admin@example.com", password: "password")

as = YearGroup.create!(name: "AS")
a2 = YearGroup.create!(name: "A2")

astrophysics = Category.create!(name: "Astrophysics")
mechanics = Category.create!(name: "Mechanics")
electricity = Category.create!(name: "Electricity")
particles = Category.create!(name: "Particles")
waves = Category.create!(name: "Waves")

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
  },
)
