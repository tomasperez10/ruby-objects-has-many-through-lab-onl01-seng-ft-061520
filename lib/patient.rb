class Patient

  attr_reader :name, :appointment, :doctor
  
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @appointment = []
  end
  
  def self.all
    @@all
  end

  def new_appointment(date, doctor)
    Appointment.new(date, self, doctor)
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.patient == self
      @appointment << self
    end
  end

  def doctors
    self.appointments.map do |appointment|
      appointment.doctor
    end
  end
end