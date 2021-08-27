# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

heaven_hill = Producer.create!(name: 'Heaven Hill')
beam_suntory = Producer.create!(name: 'Beam Suntory')
sazerac = Producer.create!(name: 'Sazerac Co.')

buffalo_trace = Distillery.create!(
  name: 'Buffalo Trace Distillery',
  city: 'Frankfort',
  state: 'Kentucky',
  country: 'United States',
  latitude: 38.21689388491328,
  longitude: -84.87044951994098,
  producer: sazerac
)
hh_bernheim = Distillery.create!(
  name: 'Heaven Hill Bernheim Distillery',
  city: 'Louisville',
  state: 'Kentucky',
  country: 'United States',
  latitude: 38.24484440591069,
  longitude: -85.78155391708552,
  producer: heaven_hill
)
makers_mark = Distillery.create!(
  name: 'Maker\'s Mark Distillery',
  city: 'Loretto',
  state: 'Kentucky',
  country: 'United States',
  latitude: 37.64706276434898,
  longitude: -85.3489364152489,
  producer: beam_suntory
)
jim_beam = Distillery.create!(
  name: 'Jim Beam American Stillhouse',
  city: 'Clermont',
  state: 'Kentucky',
  country: 'United States',
  latitude: 37.93108552367448,
  longitude: -85.65240558307111,
  producer: beam_suntory
)

Whiskey.create!(
  [
    {
      brand: 'Elijah Craig', name: 'Small Batch', style: 'Bourbon', abv: 0.47, rating: 93, distillery: hh_bernheim
    },
    {
      brand: 'Maker\'s Mark', name: '', style: 'Bourbon', abv: 0.45, distillery: makers_mark, rating: 92
    },
    {
      brand: 'Basil Hayden', name: '10 Year', style: 'Bourbon', abv: 0.4, rating: 92, distillery: jim_beam
    },
    {
      brand: 'Booker\'s', name: 'Pigskin Batch', style: 'Bourbon', abv: 0.6365, rating: 94, distillery: jim_beam
    },
    {
      brand: 'Eagle Rare', name: '10 Year', style: 'Bourbon', abv: 0.45, rating: 92, distillery: buffalo_trace
    }
  ]
)
