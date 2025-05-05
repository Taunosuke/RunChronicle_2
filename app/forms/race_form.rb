class RaceForm
  include ActiveModel::Model

  attr_accessor :name, :date, :payment_due_date, :user_id, :event, :distance

  validates :name, presence: true
  validates :date, presence: true
  validates :payment_due_date, presence: true
  validates :event, presence: true
  validates :distance, presence: true
  validates :user_id, presence: true

  delegate :persisted?, to: :race

  def initialize(attributes = nil, race: Race.new)
    @race = race
    super(attributes)
  end

  def save
    return if invalid?
    ActiveRecord::Base.transaction do
      Rails.logger.debug "👉 race: #{race.inspect}"
      race.update!(name: name, date: date, payment_due_date: payment_due_date, user_id: @user_id)
      Rails.logger.debug "👉 Event: event=#{event}, distance=#{distance}"
      event_record = Event.find_or_create_by!(event: event, distance: distance)
      Rails.logger.debug "👉 event_record: #{event_record.inspect}"
      race.event = event_record
    end
    rescue ActiveRecord::RecordInvalid => e
    Rails.logger.debug "🔥 SAVE ERROR (#{e.class}): #{e.message}"
    errors.add(:base, e.message)
    false
  end

  def to_model
    race
  end

  private

  attr_reader :race

  def event_value
    @race.event&.event
  end

  def distance_value
    @race.event&.distance
  end

  def default_attributes
    {
      name: race.name,
      date: race.date,
      payment_due_date: race.payment_due_date,
      event: race.event.event,
      distance: race.event.distance
    }
  end
end
