Director.create!([
  {directorNo: "D0078", DirectorName: "Stephen Herek"},
  {directorNo: "D1001", DirectorName: "Roger Spottiswoode"},
  {directorNo: "D3765", DirectorName: "Jane Emmerick"},
  {directorNo: "D4576", DirectorName: "John Woo"},
  {directorNo: "D5743", DirectorName: "Michael Bay"},
  {directorNo: "D7834", DirectorName: "Sally Nichols"}
])
Member.create!([
  {fName: "Karen", lName: "Parker", sex: "F", DOB: "1972-02-22", address: "22 Greenway Drive, Glasw, G12 8DS", dateJoined: "1991-01-06"},
  {fName: "Gillian", lName: "Peters", sex: "F", DOB: "1954-03-09", address: "89 Redmond Road, Glasw, G11 9YR", dateJoined: "1995-04-19"},
  {fName: "Bob", lName: "Adams", sex: "M", DOB: "1974-11-15", address: "57 Littleway Road, Glasw, G3 6DS", dateJoined: "1998-01-06"},
  {fName: "Don", lName: "Nelson", sex: "M", DOB: "1951-12-12", address: "123 Suffolk Lane,Glasw, G15 1RC", dateJoined: "2000-04-07"},
  {fName: "Lorna", lName: "Smith", sex: "F", DOB: "1972-01-01", address: "Flat 5A London Road, Glasw, G3", dateJoined: "1998-01-11"},
  {fName: "Dan", lName: "White", sex: "M", DOB: "1960-05-05", address: "200 Great Western Road, Glasw, G11 9JJ", dateJoined: "2001-05-05"}
])
Video.create!([
  {title: "Tomorrow Never Dies", certificate: "12", category: "Action", dailyRental: "5.0", price: "21.99", director_id: 2},
  {title: "Face/Off", certificate: "12", category: "Thriller", dailyRental: "5.0", price: "31.99", director_id: 4},
  {title: "The Rock", certificate: "18", category: "Action", dailyRental: "4.0", price: "29.99", director_id: 4},
  {title: "Independence Day", certificate: "PG", category: "Sci-Fi", dailyRental: "4.5", price: "32.99", director_id: 3},
  {title: "101 Dalmatians", certificate: "U", category: "Children", dailyRental: "4.0", price: "18.5", director_id: 1},
  {title: "Primary Colors", certificate: "U", category: "Comedy", dailyRental: "4.5", price: "14.5", director_id: 6}
])
Videoforrent.create!([
  {available: "\x00", video_id: 1},
  {available: "\x01", video_id: 2},
  {available: "\x01", video_id: 3},
  {available: "\x01", video_id: 4},
  {available: "\x01", video_id: 1},
  {available: "\x01", video_id: 2},
  {available: "\x01", video_id: 2},
  {available: "\x01", video_id: 5}
])
Rentalagreement.create!([
  {member_id: 1, videoforrent_id: 1, dateOut: "2000-02-05", dateReturn: "2000-02-07"},
  {member_id: 1, videoforrent_id: 2, dateOut: "2000-02-05", dateReturn: "2000-02-07"},
  {member_id: 1, videoforrent_id: 3, dateOut: "2000-02-04", dateReturn: "2000-02-06"},
  {member_id: 1, videoforrent_id: 4, dateOut: "2000-02-04", dateReturn: "2000-02-06"},
  {member_id: 3, videoforrent_id: 2, dateOut: "1999-11-11", dateReturn: "1999-11-12"},
  {member_id: 2, videoforrent_id: 3, dateOut: "1999-11-11", dateReturn: "1999-11-13"},
  {member_id: 4, videoforrent_id: 1, dateOut: "1999-11-14", dateReturn: "1999-11-16"},
  {member_id: 3, videoforrent_id: 4, dateOut: "1999-11-11", dateReturn: "1999-11-13"},
  {member_id: 1, videoforrent_id: 5, dateOut: "1999-11-12", dateReturn: "1999-11-14"},
  {member_id: 3, videoforrent_id: 2, dateOut: "2000-08-10", dateReturn: nil},
  {member_id: 2, videoforrent_id: 2, dateOut: "2000-08-17", dateReturn: "2000-08-20"},
  {member_id: 6, videoforrent_id: 1, dateOut: "2004-02-05", dateReturn: "2004-02-07"},
  {member_id: 6, videoforrent_id: 6, dateOut: "2004-02-05", dateReturn: "2004-02-07"},
  {member_id: 4, videoforrent_id: 6, dateOut: "2003-02-05", dateReturn: "2003-02-07"},
  {member_id: 1, videoforrent_id: 6, dateOut: "2002-02-05", dateReturn: "2002-02-07"}
])
