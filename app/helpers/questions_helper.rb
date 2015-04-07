module QuestionsHelper
  def link_to_add_fields(name, f)
    new_object = f.object.question_parts.klass.new
    new_object.build_correct_answer
    id = new_object.object_id
    fields = f.fields_for(:question_parts, new_object, child_index: id) do |builder|
      render("question_part_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
