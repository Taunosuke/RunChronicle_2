class RaceForm
  include ActiveModel::Model

  attr_accessor :name, :date, :payment_due_date, :event, :distance, :user_id

  validates :name, presence: true
  validates :date, presence: true
  validates :payment_due_date, presence: true
  validates :event, presence: true
  validates :distance, presence: true
  validates :user_id, presence: true

  delegate :persisted?, to: :race
  attr_reader :race

  def initialize(attributes = nil, race: Race.new)
    @race = race
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    return if invalid?
    ActiveRecord::Base.transaction do
      race.update!(name: name, date: date, payment_due_date: payment_due_date, user_id: @user_id)
      event_record = Event.find_or_create_by!(event: event, distance: distance)
      race.events << event_record
    end
    rescue ActiveRecord::RecordInvalid => e
    errors.add(:base, e.message)
    false
  end

  def to_model
    race
  end

  private

  def default_attributes
    {
      name: race.name,
      date: race.date,
      payment_due_date: race.payment_due_date,
      event: race.events.map(&:event),
      distance: race.events.map(&:distance)
    }
  end
end
