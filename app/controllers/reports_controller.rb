class ReportsController < ApplicationController
<<<<<<< HEAD
  def example
      @members  = @con.query "SELECT * FROM members"
=======
  def listamiembros
      @members  = @con.query "SELECT * FROM members"
  end
  def nombrevideos
      @videos  = @con.query "SELECT * FROM videos"
>>>>>>> origin/master
  end
  def query1
      @vquery  = @con.query "SELECT members.sex, COUNT(sex) as Number FROM members GROUP BY sex"
  end
  def query2
      @vquery  = @con.query "SELECT COUNT(*) as Cardinality FROM videos"
  end    
  def query3
      @vquery = @con.query "SELECT * FROM members ORDER BY fName, lName"
  end
  def query4
      @vquery = @con.query "SELECT * FROM videos JOIN directors ON directors.id = videos.director_id"
  end
  def query5
      @vquery = @con.query "SELECT SUM(videos.price) as Invest FROM videos JOIN videoforrents ON videos.id = videoforrents.video_id"
  end 
  def query6
      @vquery = @con.query "SELECT videos.title, COUNT(videos.id) as NumberOfCopies FROM videos JOIN videoforrents ON videos.id = videoforrents.video_id GROUP BY videos.id, videos.title"
  end
  def query7
      @vquery = @con.query "SELECT category, COUNT(videos.category) as NumberOfCopies FROM videos GROUP BY category ORDER BY NumberOfCopies DESC"
  end
  def query8
     @vquery = @con.query "SELECT title FROM videos WHERE dailyRental = (SELECT MAX(dailyRental) FROM videos )"
  end
  def query9
      @vquery = @con.query "SELECT title, SUM(DATEDIFF(dateReturn, dateOut)*dailyRental) AS Income FROM videos, rentalagreements, videoforrents WHERE videos.id = videoforrents.video_id and rentalagreements.videoforrent_id = videoforrents.id GROUP BY title"
  end
  def query10
      @vquery = @con.query "SELECT DISTINCT fName, lName FROM members JOIN rentalagreements ON members.id = rentalagreements.member_id WHERE dateReturn is NULL"
  end
  def query11
      @vquery = @con.query "SELECT title, COUNT(rentalagreements.id) As numberOfRents FROM videos, rentalagreements, videoforrents WHERE videos.id = videoforrents.video_id and rentalagreements.videoforrent_id = videoforrents.id GROUP BY title having count(rentalagreements.id) >= ALL (select COUNT(rentalagreements.id) FROM videos, rentalagreements, videoforrents WHERE videos.id = videoforrents.video_id and rentalagreements.videoforrent_id = videoforrents.id GROUP BY title)"
  end
  def query12
      @vquery = @con.query "SELECT fName, lName FROM members WHERE DOB = CURDATE()"
  end
  def query13
      @vquery = @con.query "SELECT title FROM videos LEFT JOIN videoforrents ON videos.id = videoforrents.video_id LEFT JOIN rentalagreements ON rentalagreements.videoforrent_id = videoforrents.id WHERE rentalagreements.id is NULL"
  end
  def query14
      @vquery = @con.query "SELECT fName, lName FROM members WHERE YEAR(DOB) = ( SELECT YEAR(DOB) FROM members WHERE fName = 'Lorna' and lName = 'Smith' ) AND fName != 'Lorna' and lName != 'Smith' "
  end
  def query15
      @vquery = @con.query "select CONCAT(fName,' ', lName) AS Nombre, 'with more rented videos' AS 'Posicion'
from members
where members.id in
   (select rentalagreements.member_id
   from rentalagreements
   group by member_id
   having count(videoforrent_id) >= all
         (select count(videoforrent_id)
          from rentalagreements
          group by member_id))
UNION
select CONCAT(fName,' ', lName) AS Nombre, 'with less rented videos' AS 'Posicion'
from members
where members.id in
   (select rentalagreements.member_id
   from rentalagreements
   group by member_id
   having count(videoforrent_id) <= all
         (select count(videoforrent_id)
          from rentalagreements
          group by member_id))"
  end
  def query16
      @vquery = @con.query "select fName,lName 
from members, rentalagreements , videoforrents
where members.id = rentalagreements.member_id and 
videoforrents.id = rentalagreements.videoforrent_id and
    not (fName = 'Don' and lName = 'Nelson')  and 
    members.id not in
(
select distinct members.id
from members, rentalagreements , videoforrents
where members.id = rentalagreements.member_id and 
videoforrents.id = rentalagreements.videoforrent_id and
videoforrents.video_id not in (

select videoforrents.video_id    
from members, rentalagreements , videoforrents
where members.id = rentalagreements.member_id and 
videoforrents.id = rentalagreements.videoforrent_id and
 fName = 'Don' and lName = 'Nelson'
)
)
group by fName,LName
having count(distinct videoforrents.video_id)=
        (select count(distinct videoforrents.video_id) 
         from members, rentalagreements , videoforrents
         where members.id = rentalagreements.member_id and 
         videoforrents.id = rentalagreements.videoforrent_id and
         fName = 'Don' and lName = 'Nelson')"

  end

end
