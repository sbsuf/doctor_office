require 'spec_helper'

describe 'Doctor' do
  describe '.all' do
    it("starts off with no lists") do
      expect(Doctor.all).to eq([])
    end
  end
  describe '#name' do
    it("displays the list name") do
      new_doc = Doctor.new({name: 'Dr. Bob', specialty: 'Internal Medicine', id: nil})
      expect(new_doc.name).to eq('Dr. Bob')
    end
  end
  describe '#specialty' do
    it("displays the specialty") do
      new_doc = Doctor.new({name: 'Dr. Bob', specialty: 'Internal Medicine', id: nil})
      expect(new_doc.specialty).to eq('Internal Medicine')
    end
  end

  describe '#id' do
    it("displays the id") do
      new_doc = Doctor.new({name: 'Dr. Bob', specialty: 'Internal Medicine', id: nil})
      new_doc.save
      expect(new_doc.id).to be_an_instance_of(Fixnum)
    end
  end
  describe 'save' do
    it 'saves list item to the database' do
      new_doc = Doctor.new({name: 'Dr. Bob', specialty: 'Internal Medicine', id: nil})
      new_doc.save
      expect(Doctor.all).to eq([new_doc])
    end
  end
  describe '#==' do
    it("is the same task if it has the same description") do
      doc1 = Doctor.new({name: 'Dr. Bob', specialty: 'Internal Medicine', id: nil})
      doc2 = Doctor.new({name: 'Dr. Bob', specialty: 'Internal Medicine', id: nil})
      expect(doc1).to eq(doc2)
    end
  end
  describe 'patient_list' do
    it("is the same task if it has the same description") do
      doc = Doctor.new({name: 'Dr. Bob', specialty: 'Internal Medicine', id: 1})
      patient = Patient.new({name:'Donald Trump', birthday: '1945-08-30', doctor_id: 1, id: nil})
      patient.save
      expect(doc.patient_list).to eq([patient])
    end
  end
  describe '.find' do
    it("finds doc by id and returns doctor") do
      doc1 = Doctor.new({name: 'Dr. Bob', specialty: 'Internal Medicine', id: nil})
      doc1.save
      expect(Doctor.find(doc1.id)).to eq(doc1)
    end
  end
end
