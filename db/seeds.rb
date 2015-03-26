Admin.create!(email: "admin@example.com", password: "password", first_name: "Miguel", last_name: "Cabero")

tutorial = Category.create!(name: "Tutorial (prerequisite for new students)", tutorial: true)
astrophysics = Category.create!(name: "Astrophysics", year: "A2")
mechanics = Category.create!(name: "Mechanics", year: "AS")
electricity = Category.create!(name: "Electricity", year: "A2")
particles = Category.create!(name: "Particles", year: "A2")
waves = Category.create!(name: "Waves", year: "AS")

ox  = ExamBoard.create!(name: 'University of Oxford Delegacy of Local Examinations')
cam = ExamBoard.create!(name: 'University of Cambridge Local Examinations Syndicate')

school = ox.schools.create(name: "Hogwarts")
school.students.create!(email: "student@example.com", password: "password", first_name: "Harry", last_name: "Potter", birthday: "1981/7/31".to_date)

# Tutorial questions

Question.create({ 
  category_id: tutorial.id,
  description: '',
  hint: '',
  question_parts_attributes: [
    { description: %q{
        <p>
          An object is thrown upwards with a speed of 25 ms<sup>-1</sup>. How high will it be when the speed is 12 ms<sup>-1</sup>.
        </p>
        <p>
          Write down the equation you would use to solve this in a single equation. 
        </p>
      }.squish,
      marks: 1,
      answer_type: "formula",
      correct_answer_attributes: {
        content: "`v^2 = u^2 + 2as`"
      }
    }
  ]
})

Question.create({ 
  category_id: tutorial.id,
  description: '',
  hint: '',
  question_parts_attributes: [
    { description: %q{
        <p>
          An aeroplane is flying horizontally and heading north through the air. Its
speed through the air is <em>a</em> and the wind is blowing east with a speed <em>b</em>.
What formula would you use to calculate the speed over the ground?  
        </p>
      }.squish,
      marks: 1,
      answer_type: "formula",
      correct_answer_attributes: {
        content: "`sqrt(a^2 + b^2)`"
      }
    }
  ]
})

Question.create({ 
  category_id: tutorial.id,
  description: '',
  hint: '',
  question_parts_attributes: [
    { description: %q{
        <p>
          An aeroplane is flying horizontally and heading north through the air. Its
speed through the air is <em>a</em> and the wind is blowing east with a speed <em>b</em>.
How would you calculate the angle from north at which the plane flies
over the ground? 
        </p>
      }.squish,
      marks: 1,
      answer_type: "formula",
      correct_answer_attributes: {
        content: "`tan^(-1)(b/a)`"
      }
    }
  ]
})


# Other questions
question = Question.create!(
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
categories = Category.real.to_a
exam_boards = ExamBoard.all.to_a

20.times do ||
  Question.create!(
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

math = Category.create!(name: "Super simple math", year: "AS")

20.times do ||
  a = (1..10).to_a.sample(4)
  Question.create!(
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
