class Doctor
  attr_reader(:id, :name, :specialty)

  def initialize(attributes)
    @name = attributes[:name]
    @specialty = attributes[:specialty]
    @id = attributes[:id]
  end

  def patient_list
    returned_people = DB.exec("SELECT * FROM patient WHERE doctor_id = '#{@id}';")
    patients = []
    returned_people.each do |person|
      patients.push(Patient.new({name: person['name'], id: person['id'].to_i, birthday: person['birthday'], doctor_id: person['doctor_id'].to_i}))
    end
    patients
  end

  def self.all
    returned_doc = DB.exec("SELECT * FROM doctor;")
    doctors = []
    returned_doc.each do |doctor|
      name = doctor.fetch('name')
      specialty = doctor.fetch('specialty')
      id = doctor.fetch('id').to_i
      doctors.push(Doctor.new({name: name, specialty: specialty, id: id}))
    end
    doctors
  end

  def save
    result = DB.exec("INSERT INTO doctor (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def ==(second)
    self.name == second.name && self.specialty == second.specialty && self.id == second.id
  end
end
