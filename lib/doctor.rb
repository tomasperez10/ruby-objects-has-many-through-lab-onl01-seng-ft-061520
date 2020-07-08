class Doctor

  attr_reader :name, :appointment, :patient

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @appointment = []
  end

  def self.all
    @@all
  end

  def new_appointment(patient, date)
    Appointment.new(patient, self, date)
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.doctor == self
      @appointment << appointment.doctor
    end
  end

  def patients
    self.appointments.map do |appointment|
      appointment.patient
    end
  end

end