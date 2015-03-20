Admin.create!(email: "admin@example.com", password: "password", first_name: "Miguel", last_name: "Cabero")

as = YearGroup.create!(name: "AS")
a2 = YearGroup.create!(name: "A2")

ox  = ExamBoard.create!(name: 'University of Oxford Delegacy of Local Examinations')
cam = ExamBoard.create!(name: 'University of Cambridge Local Examinations Syndicate')

astrophysics = Category.create!(name: "Astrophysics")
mechanics = Category.create!(name: "Mechanics")
electricity = Category.create!(name: "Electricity")
particles = Category.create!(name: "Particles")
waves = Category.create!(name: "Waves")

school = ox.schools.create(name: "Hogwarts")
school.students.create!(email: "student@example.com", password: "password", first_name: "Harry", last_name: "Potter", birthday: "1981/7/31".to_date)

question = Question.create!(
  year_group_id: as.id,
  category_id: astrophysics.id,
  exam_board_ids: [ox.id],
  description: %q{
    Suppose we have a particle in 1-dimension, with wavefunction $$Ae^{-\frac{|x|}{2d}}$$.
  }.squish,
  hint: %q{
    Remember $$Ae^{-\frac{|x|}{2d}}$$, bla bla bla.
  }.squish,
  question_parts_attributes: [
    {
      description: %q{
        What is the probability to find the particle in the interval $$[0,d]$$?
        <br>
        Please provide your answer in terms of $$A$$, $$d$$, mathematical constants such as $$\pi$$ (entered as <code>pi</code>) or $$e$$ (entered as <code>e</code>).
        (<b>Assume that A is real</b>)
      }.squish,
      marks: 1,
      answer_type: "formula",
      correct_answer_attributes: {
        content: "`A^2+d+pi-e`"
      }
    }
  ]
)

year_groups = YearGroup.all.to_a
categories = Category.all.to_a
exam_boards = ExamBoard.all.to_a

20.times do ||
  Question.create!(
    year_group_id: year_groups.sample.id,
    category_id: categories.sample.id,
    exam_board_ids: exam_boards.sample(rand(1..2)).map(&:id),
    description: "(UID:#{rand(1000)}) Name the constituent of an atom which",
    hint: "bla bla bla",
    question_parts_attributes: [
      {
        description: "has zero charge,",
        marks: rand(1..2),
        answer_type: "multiple bool",
        correct_answer_attributes: {
          content: "neutron OR n"
        }
      },
      {
        description: "has the largest specific charge,",
        marks: rand(1..2),
        answer_type: "multiple bool",
        correct_answer_attributes: {
          content: "electron OR e-"
        }
      },
      {
        description: "when removed leaves a different isotope of the element.",
        marks: rand(1..2),
        answer_type: "multiple bool",
        correct_answer_attributes: {
          content: "neutron OR n"
        }
      }
    ]
  )
end

math = Category.create!(name: "Super simple math")

20.times do ||
  a = (1..10).to_a.sample(4)
  Question.create!(
    year_group_id: year_groups.sample.id,
    category_id: math.id,
    exam_board_ids: exam_boards.sample(rand(1..2)).map(&:id),
    description: "(UID:#{rand(1000)}) Simple math question",
    hint: "bla bla bla",
    question_parts_attributes: [
      {
        description: "#{a[0]} + #{a[1]}",
        marks: 1,
        answer_type: "integer",
        correct_answer_attributes: {
          content: "#{a[0] + a[1]}"
        }
      },
      {
        description: "#{a[2]} + #{a[3]}",
        marks: rand(1..2),
        answer_type: "integer",
        correct_answer_attributes: {
          content: "#{a[2] + a[3]}"
        }
      }
    ]
  )
end


