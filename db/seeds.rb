# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# NEDED TO CHANGE MANY ID's to correlate correctly if YOU WANT THIS SEED FILE TO WORK!

Golfer.create!([
  {name: 'Paul', email: "psnider@fake.com", password: 'handicap123', password_confirmation: 'handicap123'},
  {name: 'DJ', email: "dj@fake.com", password: 'dustin123', password_confirmation: 'dustin123'},
  {name: 'Tiger', email: "tiger@fake.com", password: 'tiger123', password_confirmation: 'tiger123'},
  {name: 'Jordan Spieth', email: "jordan@fake.com", password: 'jordan123', password_confirmation: 'jordan123'},
  {name: 'Bill S', email: "bill@fake.com", password: 'bill123', password_confirmation: 'bill123'},
  {name: 'Elmer Sanders', email: "elmer@fake.com", password: 'elmer123', password_confirmation: 'elmer123'},
  {name: 'Paul Sanders', email: "paul@fake.com", password: 'paul123', password_confirmation: 'paul123'},
  {name: 'Rickie Fowler', email: "rickie@fake.com", password: 'rickie123', password_confirmation: 'rickie123'}
])
GolfCourse.create!([
  {name: "Pine Valley", description: "A genuine original, its unique character forged from the sandy pine barrens of southwest Jersey.", holes: 18, total_par: 70, course_slope: 153, course_rating: 73.5},
  {name: "Cypress Point", description: "Woven through cypress, sand dunes and jagged coastline.", holes: 18, total_par: 72, course_slope: 139, course_rating: 72.1},
  {name: "Fishers Island", description: "Water views with an idyllic New England shoreline framing it.", holes: 18, total_par: 70, course_slope: 143, course_rating: 72.2},
  {name: "Los Angeles C.C. (North)", description: "Unbelievable mounding and sloping for a course in the middle of Los Angeles", holes: 18, total_par: 71, course_slope: 139, course_rating: 74.6},
  {name: "Almaden C.C.", description: "Located in the beautiful Almaden Valley of San Jose and nestled in the foothills of the Santa Cruz Mountains.", holes: 18, total_par: 72, course_slope: 129, course_rating: 72.1},
  {name: "Torrey Pines - South", description: "Torrey Pines Golf Course, located in La Jolla, sits on the coastal cliffs overlooking the Pacific Ocean and is recognized as the premier municipal golf course owned and operated by a city. It is named after the Torrey Pine, a rare tree that grows in the wild only along this local stretch of the coastline in San Diego County and on Santa Rosa Island.", holes: 18, total_par: 72, course_slope: 138, course_rating: 75.4},
  {name: "Shadow Creek", description: "There are few golf settings in the world like this one. As well as the exclusivity and celebrities that are almost always on property. What a great experience that I would recommend to anybody who plays this game.", holes: 18, total_par: 72, course_slope: 138, course_rating: 73.2},
  {name: "Pebble Beach", description: "This is the ultimate round of golf along the ocean, creating one of the most beautiful atmospheres in golf—especially the stretch of holes from four to 10. A day at Pebble Beach, no matter your score, will always be a good day.", holes: 18, total_par: 72, course_slope: 143, course_rating: 74.7},
  {name: "TPC Myrtle Beach", description: "TPC Myrtle Beach is a Myrtle Beach golf course located in Murrells Inlet, South Carolina. TPC Myrtle Beach was designed by Tom Fazio and offers 18 holes of breathtaking golf", holes: 18, total_par: 72, course_slope: 138, course_rating: 72.5},
  {name: "Santa Teresa", description: "Our par 71, 6742 yard course is one of the most challenging courses in the Bay Area. Santa Teresa is a pleasingly designed course surrounded by many beautiful trees. Golfers will enjoy the wide fairways, fast greens and strategically placed hazards.", holes: 18, total_par: 71, course_slope: 125, course_rating: 70.9},
  {name: "Lahontan", description: "In summer 1998, world-class private golf found a spectacular new home in North Lake Tahoe. Lahontan, with its acclaimed Tom Weiskopf-designed 18-hole championship course.", holes: 18, total_par: 72, course_slope: 141, course_rating: 72.1},
  {name: "Marietta C.C", description: "The rolling hills of Southeastern Ohio provide the backdrop to our excellent 18-holes of golf. The pristine condition of the golf course at Marietta County Club is matched only by the surrounding beauty of our wildlife and incredible views. ", holes: 18, total_par: 70, course_slope: 123, course_rating: 68.8},
  {name: "Aptos Seascape", description: "Located only a half mile away from the shores of the Pacific Ocean and framed by majestic Monterey pines and towering eucalyptus trees, Seascape Golf Club’s 6,034-yard par 71, exceedingly-playable golf course features immaculately-manicured fairways, rolling hills, and small, challenging greens.", holes: 18, total_par: 71, course_slope: 129, course_rating: 70.2},
  {name: "Los Lagos", description: "Los Lagos combines environmental preservation with a state-of-the-art facility. Designed by Brian Costello of JMP Golf Design Group in Belmont, the golf course is carefully integrated into the natural habitat surrounding Coyote Creek. The golf course was designed to appeal to players at all levels of ability, and features both challenging and conservative routes of play on most holes.", holes: 18, total_par: 68, course_slope: 113, course_rating: 65.4},
  {name: "Balboa Park", description: "It features stellar views of downtown San Diego, Balboa Park, Point Loma and the Pacific Ocean. The oldest public golf facility in San Diego, Balboa Park Golf Course also offers a driving range, Pro Shop, coffee shop, halfway house and practice putting greens.", holes: 18, total_par: 72, course_slope: 125, course_rating: 71.2},
  {name: "Foxtail Golf Club - North", description: "With two 18-hole championship golf courses in the heart of the Wine Country, Foxtail Golf Club offers the perfect location for your next golf tournament, banquet or event.", holes: 18, total_par: 72, course_slope: 126, course_rating: 73.0},
  {name: "The Presidio", description: "The prestigious Presidio Golf Course opened for public play in 1995 and has quickly gained a reputation as one of the nation's top public courses. Located just minutes from downtown San Francisco, this 18-hole course plays 6,500 yards of challenging golf winding through beautiful Eucalyptus and Monterey Pine trees in The City's trademark hills. Originally designed by Robert Wood Johnstone, the course was expanded in 1910 by Johnstone in collaboration with William McEwan, and then was redesigned and lengthened by the British firm of Fowler & Simpson in 1921.", holes: 18, total_par: 72, course_slope: 135, course_rating: 72.6},
  {name: "DeLaveaga", description: "DeLaveaga Golf Course is perched atop the hills surrounding Santa Cruz, California, providing championship caliber golf and excellent service to residents and visitors alike. As one of the top ranked public courses in California, Delaveaga combines striking natural beauty with a challenging and thoughtful course design featuring tree lined fairways, deep canyons, and infamous 10th hole.", holes: 18, total_par: 70, course_slope: 136, course_rating: 70.0},
  {name: "Medalist Golf Club", description: "Medalist Golf Club is a fantastic experience, however it is very difficult. Greg Norman brought a piece of Royal Melbourne to the southeast coast of Florida. The course conditions at Medalist are a large part of the courses challenge; the greens are firm and fast with lies around the greens that are very tight.", holes: 18, total_par: 72, course_slope: 138, course_rating: 72.6},
  {name: "St. Andrews Old Course", description: "The oldest and most iconic golf course in the world. The Swilcan Bridge and Hell Bunker are recognised across the globe, yet the greatest feature of the Old Course is that despite its grand status it remains a public golf course, open to all.", holes: 18, total_par: 72, course_slope: 132, course_rating: 73.1},
  {name: "Pikewood National", description: "Located high atop a mesa in a mountain setting near Morgantown, West Virginia, Pikewood National Golf Club is a breathtakingly scenic and wonderfully challenging core golf course. Pikewood National is designed in the classic tradition of preeminent “golden age” golf course architects. Moreover, Pikewood National is a golf course built by players, specifically for players, embodying everything that is good and pure about the game.", holes: 18, total_par: 72, course_slope: 155, course_rating: 79.3}
])

Tag.create!([
  {name: "Ocean Course"},
  {name: "PGA Course"},
  {name: "public"},
  {name: "Robert Johnstone"},
  {name: "North Bay"},
  {name: "Good Value"},
  {name: "Stunning Views"},
  {name: "Santa Cruz"},
  {name: "Elmer Sanders"},
  {name: "private"},
  {name: "18th water hole"},
  {name: "hilly"},
  {name: "celebs"},
  {name: "fast greens"},
  {name: "difficult"},
  {name: "Fun"},
  {name: "deep bunkers"},
  {name: "short"},
  {name: "full driving range"},
  {name: "links course"},
  {name: "Morgantown"}
])

GolfCourseComment.create!([
  {content: "best day ever!", golfer_id: 1, golf_course_id: 20},
  {content: "Really fun course!", golfer_id: 1, golf_course_id: 14},
  {content: "This course kicked my ass!", golfer_id: 1, golf_course_id: 21}
])

GolfCourseTag.create!([
  {golf_course_id: 1, tag_id: 15},
  {golf_course_id: 2, tag_id: 1},
  {golf_course_id: 2, tag_id: 7},
  {golf_course_id: 3, tag_id: 1},
  {golf_course_id: 3, tag_id: 14},
  {golf_course_id: 5, tag_id: 10},
  {golf_course_id: 5, tag_id: 11},
  {golf_course_id: 6, tag_id: 1},
  {golf_course_id: 6, tag_id: 2},
  {golf_course_id: 6, tag_id: 3},
  {golf_course_id: 8, tag_id: 1},
  {golf_course_id: 8, tag_id: 2},
  {golf_course_id: 8, tag_id: 7},
  {golf_course_id: 8, tag_id: 14},
  {golf_course_id: 12, tag_id: 9},
  {golf_course_id: 12, tag_id: 10},
  {golf_course_id: 15, tag_id: 3},
  {golf_course_id: 16, tag_id: 3},
  {golf_course_id: 16, tag_id: 5},
  {golf_course_id: 16, tag_id: 6},
  {golf_course_id: 17, tag_id: 3},
  {golf_course_id: 17, tag_id: 4},
  {golf_course_id: 18, tag_id: 8},
  {golf_course_id: 13, tag_id: 8},
  {golf_course_id: 20, tag_id: 3},
  {golf_course_id: 20, tag_id: 20},
  {golf_course_id: 19, tag_id: 14},
  {golf_course_id: 19, tag_id: 15}
])

Round.create!([
  {score: 92, golfer_id: 1, golf_course_id: 2},
  {score: 90, golfer_id: 1, golf_course_id: 3},
  {score: 68, golfer_id: 2, golf_course_id: 1},
  {score: 70, golfer_id: 4, golf_course_id: 2},
  {score: 67, golfer_id: 4, golf_course_id: 1},
  {score: 70, golfer_id: 4, golf_course_id: 3},
  {score: 68, golfer_id: 2, golf_course_id: 2},
  {score: 88, golfer_id: 1, golf_course_id: 5},
  {score: 91, golfer_id: 1, golf_course_id: 6},
  {score: 95, golfer_id: 1, golf_course_id: 3},
  {score: 95, golfer_id: 1, golf_course_id: 5},
  {score: 72, golfer_id: 4, golf_course_id: 2},
  {score: 75, golfer_id: 4, golf_course_id: 2},
  {score: 73, golfer_id: 4, golf_course_id: 4},
  {score: 76, golfer_id: 4, golf_course_id: 9},
  {score: 72, golfer_id: 2, golf_course_id: 1},
  {score: 72, golfer_id: 2, golf_course_id: 2},
  {score: 72, golfer_id: 2, golf_course_id: 3},
  {score: 72, golfer_id: 2, golf_course_id: 3},
  {score: 72, golfer_id: 2, golf_course_id: 2},
  {score: 72, golfer_id: 2, golf_course_id: 4},
  {score: 72, golfer_id: 2, golf_course_id: 4},
  {score: 72, golfer_id: 2, golf_course_id: 4},
  {score: 72, golfer_id: 2, golf_course_id: 5},
  {score: 72, golfer_id: 2, golf_course_id: 5},
  {score: 72, golfer_id: 2, golf_course_id: 5},
  {score: 72, golfer_id: 2, golf_course_id: 6},
  {score: 72, golfer_id: 2, golf_course_id: 6},
  {score: 72, golfer_id: 2, golf_course_id: 6},
  {score: 73, golfer_id: 2, golf_course_id: 6},
  {score: 73, golfer_id: 2, golf_course_id: 7},
  {score: 73, golfer_id: 2, golf_course_id: 7},
  {score: 73, golfer_id: 2, golf_course_id: 8},
  {score: 73, golfer_id: 2, golf_course_id: 9},
  {score: 73, golfer_id: 2, golf_course_id: 9},
  {score: 73, golfer_id: 2, golf_course_id: 9},
  {score: 70, golfer_id: 2, golf_course_id: 9},
  {score: 71, golfer_id: 2, golf_course_id: 9},
  {score: 69, golfer_id: 2, golf_course_id: 9},
  {score: 68, golfer_id: 2, golf_course_id: 9},
  {score: 74, golfer_id: 2, golf_course_id: 9},
  {score: 71, golfer_id: 2, golf_course_id: 9},
  {score: 76, golfer_id: 5, golf_course_id: 5},
  {score: 79, golfer_id: 5, golf_course_id: 5},
  {score: 84, golfer_id: 5, golf_course_id: 2},
  {score: 82, golfer_id: 5, golf_course_id: 8},
  {score: 80, golfer_id: 5, golf_course_id: 5},
  {score: 82, golfer_id: 6, golf_course_id: 11},
  {score: 80, golfer_id: 6, golf_course_id: 11},
  {score: 78, golfer_id: 6, golf_course_id: 11},
  {score: 74, golfer_id: 4, golf_course_id: 8},
  {score: 75, golfer_id: 4, golf_course_id: 7},
  {score: 73, golfer_id: 4, golf_course_id: 6},
  {score: 79, golfer_id: 5, golf_course_id: 12},
  {score: 85, golfer_id: 1, golf_course_id: 9},
  {score: 82, golfer_id: 1, golf_course_id: 13},
  {score: 96, golfer_id: 1, golf_course_id: 7},
  {score: 93, golfer_id: 1, golf_course_id: 14},
  {score: 94, golfer_id: 1, golf_course_id: 3},
  {score: 90, golfer_id: 1, golf_course_id: 14},
  {score: 92, golfer_id: 1, golf_course_id: 16},
  {score: 87, golfer_id: 7, golf_course_id: 12},
  {score: 84, golfer_id: 7, golf_course_id: 12},
  {score: 72, golfer_id: 8, golf_course_id: 15},
  {score: 70, golfer_id: 8, golf_course_id: 9},
  {score: 89, golfer_id: 1, golf_course_id: 16},
  {score: 87, golfer_id: 1, golf_course_id: 8},
  {score: 90, golfer_id: 1, golf_course_id: 3},
  {score: 88, golfer_id: 1, golf_course_id: 6},
  {score: 92, golfer_id: 1, golf_course_id: 7},
  {score: 70, golfer_id: 4, golf_course_id: 3}
])
