# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kate = User.create(
    first_name: "Kate", 
    last_name: "Snow", 
    email: "katesnow@gmail.com", 
    instrument: "viola",
    bio: "Kate Shaner is a dedicated and passionate Suzuki teacher, music educator and arts administrator. She’s looking forward to joining the admin team at the Miles Nadal JCC Suzuki Program as the Administrative Assistant beginning fall 2020. In addition to her admin duties, she teaches group classes, private lessons and the Suzuki Early Childhood Music class at the MNjcc. \r\n\r\nPrior to moving to Toronto, Kate was the assistant director of Greenwich Suzuki Academy and head of development for the Friends of Greenwich Suzuki Academy fund. She was also a primary member of the violin, viola, and SECE faculty. Prior to joining GSA in 2017, she served as the director of the Milford Branch at The Music School of Delaware and a core violin and viola faculty member in the school’s Suzuki Academy from 2013-2017. In 2016, Kate was selected as one of Delaware’s top young professionals and received the Delaware Business Times “Best 40 under 40” award. From 2008 to 2013, she taught viola and chamber music at Interlochen Arts Summer Camp. She also served on the board of directors for the Greater Philadelphia Suzuki Association from 2016-2017.\r\n\r\nKate is a registered Suzuki teacher with the Suzuki Association of the Americas in ECC, SPA, SECE Unit 1, violin units 1-6, violin practicum, and viola unit 5. She is a graduate of Interlochen Arts Academy and holds degrees from the University of Memphis (B.M.) and Ithaca College (M.M., Suzuki Pedagogy). While at Ithaca College, she completed the long term Suzuki training program under Sanford Reuning and Carrie Reuning-Hummel, with additional instruction from Edward Kreitman, Stephanie Sandven, Teri Einfeldt and April Losey. Kate has studied Suzuki Early Childhood Education with trainers Lynn McCall and Danette Schuh. Her principal viola teachers have included Debra Moree, Lenny Schranze, David Holland and Shelley Beard Santore. Kate’s students have been accepted into prestigious training programs including Interlochen Arts Academy and Sphinx Performance Academy.",
    contractor: true,
    password: "kate"
)

yasmin = User.create(
    first_name: "Yasmin", 
    last_name: "Winter", 
    email: "yasmin@gmail.com", 
    instrument: "piano",
    bio: "Yasmin is an accomplished pianist in the MYC area. She is also a well sought out teacher for all ages.",
    contractor: false,
    password: "yasmin"
)

margot = User.create(
    first_name: "Margot", 
    last_name: "Bear", 
    email: "margot@gmail.com", 
    instrument: "cello",
    bio: "Margot is an amazing diva.",
    contractor: false,
    password: "margot"
)

wedding = Gig.create(
    title: "Wedding Gig", 
    datetime: "2021-01-08 15:30:00", 
    description: "1 hr of music. Cocktail and ceremony", 
    payment: 300.00, 
    user_id: 1
)

jazz = Gig.create(
title: "Jazz Band", 
datetime: "2021-01-08 15:30:00", 
description: "1 hr music in the park. Area will be provided with...", 
payment: 0.1e4, 
user_id: 1
)


violin = Instrument.create(name: "violin")
viola = Instrument.create(name: "viola") 
cello = Instrument.create(name: "cello")
piano = Instrument.create(name: "piano")
voice = Instrument.create(name: "voice")
drumset = Instrument.create(name: "drumset")
bass = Instrument.create(name: "bass")

a = GigInstrument.create(gig_id: 1, instrument_id: violin)
b = GigInstrument.create(gig_id: 1, instrument_id: viola)
c = GigInstrument.create(gig_id: 1, instrument_id: cello)

d = GigInstrument.create(gig_id: 2, instrument_id: piano)
e = GigInstrument.create(gig_id: 2, instrument_id: voice)
f = GigInstrument.create(gig_id: 2, instrument_id: bass)
g = GigInstrument.create(gig_id: 2, instrument_id: drumset)

request = Request.create(user_id: 2, gig_id: 2, application: true)
request2 = Request.create(user_id: 3, gig_id: 1, application: true)









