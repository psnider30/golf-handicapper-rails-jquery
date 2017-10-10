# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Golfer.create(name: 'Paul', email: 'psnider@fake.com', password: 'handicap123')
Golfer.create(name: 'DJ', email: 'dj@fake.com', password: 'dustin123')

GolfCourse.create(name: 'Pine Valley', description: 'A genuine original, its unique character forged from the sandy pine barrens of southwest Jersey.',
holes: 18, total_par: 70, course_slope: 153, course_rating: 73.5)
GolfCourse.create(name: 'Cypress Point', description: 'Woven through cypress, sand dunes and jagged coastline.',
holes: 18, total_par: 72, course_slope: 139, course_rating: 72.1)
GolfCourse.create(name: 'Fishers Island', description: 'Water views with an idyllic New England shoreline framing it.',
holes: 18, total_par: 70, course_slope: 143, course_rating: 72.2)

Round.create(score: 92, golfer_id: 1, golf_course_id: 2)
Round.create(score: 90, golfer_id: 1, golf_course_id: 3)
Round.create(score: 68, golfer_id: 2, golf_course_id: 1)
Round.create(score: 67, golfer_id: 1, golf_course_id: 3)
