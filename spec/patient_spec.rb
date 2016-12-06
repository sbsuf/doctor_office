require 'spec_helper'

describe 'Patient' do
  describe '.all' do
  it("starts off with no lists") do
    expect(Patient.all).to eq([])
  end
end

describe '#name' do
  it("displays the list of patient name") do
    new_patient = Patient.new({name:'Donald Trump', birthday: '1945-08-30', doctor_id: 1, id: nil})
    expect(new_patient.name).to eq('Donald Trump')
  end
end

describe '#birthday' do
  it("display each patient birthday") do
    new_patient = Patient.new({name:'Donald Trump', birthday: '1945-08-30', doctor_id: 1, id: nil})
    expect(new_patient.birthday).to eq('1945-08-30')
  end
end

describe '#id' do
  it("display id") do
    new_patient = Patient.new({name:'Donald Trump', birthday: '1945-08-30', doctor_id: 1, id: nil})
    new_patient.save
    expect(new_patient.id).to be_an_instance_of(Fixnum)
   end
end

describe 'save' do
  it 'saves patients to the database' do
    new_patient = Patient.new({name: 'Donald Trump', birthday: '1945-08-30', id: nil, doctor_id: 1,})
    new_patient.save
    expect(Patient.all).to eq([new_patient])
  end
end

describe '#==' do
  it("is the same patient if it has the same description") do
    patient1 = Patient.new({name: 'Donald Trump', birthday: '1945-08-30', id: nil, doctor_id: 1,})
    patient2 = Patient.new({name: 'Donald Trump', birthday: '1945-08-30', id: nil, doctor_id: 1,})
    expect(patient1).to eq(patient2)
    end
  end
end
