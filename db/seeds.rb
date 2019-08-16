# frozen_string_literal: true

emails = %w[eli@woof.com santiago@woof.com dulce@woof.com]

3.times do |i|
  user = User.create(name: Faker::DcComics.unique.name,
                     username: Faker::Name.first_name,
                     email: emails[i])

  5.times do
    user.events.build(
      title: Faker::Hacker.say_something_smart,
      date_event: Faker::Time.between(from: 3.months.ago, to: 2.month.from_now, format: :default),
      description: Faker::Lorem.paragraph_by_chars,
      place: Faker::University.name
    ).save
    user.attendances.build(attended_event_id: Event.last.id).save
  end

end
