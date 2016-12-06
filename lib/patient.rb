class Patient
  attr_reader(:id, :name, :birthday, :doctor_id)

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @birthday = attributes[:birthday]
    @doctor_id = attributes[:doctor_id]
  end

  def self.all()
    returned_patient = DB.exec("SELECT * FROM patient")
    patients = []
    returned_patient.each do |patient|
     name = patient.fetch('name')
     id = patient.fetch('id').to_i
     birthday = patient.fetch('birthday')
     doctor_id = patient.fetch('doctor_id').to_i
     patients.push(Patient.new({name: name, birthday: birthday, id: id, doctor_id: doctor_id}))
   end
   patients
  end

  def save()
    result = DB.exec("INSERT INTO patient (name, birthday, doctor_id) VALUES ('#{@name}', '#{@birthday}', '#{@doctor_id}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def ==(second)
    self.name == second.name && self.birthday == second.birthday && self.doctor_id == second.doctor_id && self.id == second.id
  end
end
