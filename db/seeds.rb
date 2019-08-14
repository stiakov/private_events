# frozen_string_literal: true

emails = ['eli@woof.com', 'santiago@woof.com', 'dulce@woof.com']

3.times do |i|
  user = User.create(name: Faker::Artist.name,
                     username: Faker::Name.first_name,
                     email: emails[i])

  5.times do
    user.events.build(
      title: Faker::Quotes::Shakespeare.hamlet_quote,
      date_event: Faker::Time.between(from: 3.months.ago, to: 1.month.from_now, format: :default),
      description: Faker::Hacker.say_something_smart,
      place: Faker::University.name
    ).save
    user.attendances.build(attended_event_id: Event.last.id).save
  end

end
