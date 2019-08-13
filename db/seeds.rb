# frozen_string_literal: true

emails = ['eli@woof.com', 'santiago@woof.com', 'dulce@woof.com']

3.times do |i|
  user = User.create(name: Faker::Name.name,
                     username: Faker::Name.first_name,
                     email: emails[i])

  5.times do
    user.events.build(
      title: Faker::Lorem.sentence,
      date_event: Faker::Time.between(from: 3.months.ago, to: 1.month.from_now, format: :default),
      description: Faker::Lorem.paragraph,
      place: Faker::University.name,
    ).save
    user.attendances.build(attended_event_id: Event.last.id).save
  end

end
