class ReportsController < ApplicationController
  def example
      @members  = @con.query "SELECT * FROM members"
  end
  def query1
      @vquery  = @con.query "SELECT members.sex, COUNT(sex) as Number FROM members GROUP BY sex"
  end
  def query2
      @vquery  = @con.query "SELECT COUNT(*) as Cardinality FROM videos"
  end    
  def query3
      @vquery = @con.query "SELECT * FROM members ORDER BY first_name, last_name"
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
      @vquery = @con.query "SELECT category, COUNT(videos.title) as NumberOfVideos FROM videos GROUP BY category ORDER BY NumberOfVideos DESC"
  end
  def query8
     @vquery = @con.query "SELECT title FROM videos WHERE daily_rental = (SELECT MAX(daily_rental) FROM videos )"
  end
  def query9
      @vquery = @con.query "SELECT title, SUM(DATEDIFF(dateReturn, dateOut)*daily_rental) AS Income FROM videos, rentalagreements, videoforrents WHERE videos.id = videoforrents.video_id and rentalagreements.videoforrent_id = videoforrents.id GROUP BY title"
  end
  def query10
      @vquery = @con.query "SELECT DISTINCT first_name, last_name FROM members JOIN rentalagreements ON members.id = rentalagreements.member_id WHERE dateReturn is NULL"
  end
  def query11
      @vquery = @con.query "SELECT title, COUNT(rentalagreements.id) As numberOfRents FROM videos, rentalagreements, videoforrents WHERE videos.id = videoforrents.video_id and rentalagreements.videoforrent_id = videoforrents.id GROUP BY title having count(rentalagreements.id) >= ALL (select COUNT(rentalagreements.id) FROM videos, rentalagreements, videoforrents WHERE videos.id = videoforrents.video_id and rentalagreements.videoforrent_id = videoforrents.id GROUP BY title)"
  end
  def query12
      @vquery = @con.query "SELECT first_name, last_name FROM members WHERE date_of_birth = CURDATE()"
  end
  def query13
      @vquery = @con.query "select V.title
FROM videos V
where V.id NOT IN 
(
	select B.id
	from videos B, videoforrents VF, rentalagreements RA
	where B.id = VF.video_id and VF.id = RA.videoforrent_id

);"
  end
  def query14
      @vquery = @con.query "SELECT first_name, last_name FROM members WHERE YEAR(date_of_birth) = ( SELECT YEAR(date_of_birth) FROM members WHERE first_name = 'Lorna' and last_name = 'Smith' ) AND first_name != 'Lorna' and last_name != 'Smith' "
  end
  def query15
      @vquery = @con.query "select CONCAT(first_name,' ', last_name) AS Nombre, 'with the highest number of rentals' AS 'Position'
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
select CONCAT(first_name,' ', last_name) AS Nombre, 'with the least number of rentals' AS 'Posicion'
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
      @vquery = @con.query "select first_name,last_name 
from members, rentalagreements , videoforrents
where members.id = rentalagreements.member_id and 
videoforrents.id = rentalagreements.videoforrent_id and
    not (first_name = 'Don' and last_name = 'Nelson')  and 
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
 first_name = 'Don' and last_name = 'Nelson'
)
)
group by first_name,last_name
having count(distinct videoforrents.video_id)=
        (select count(distinct videoforrents.video_id) 
         from members, rentalagreements , videoforrents
         where members.id = rentalagreements.member_id and 
         videoforrents.id = rentalagreements.videoforrent_id and
         first_name = 'Don' and last_name = 'Nelson')"

  end
  def query17
      @vquery = @con.query "select V.title
                            from videos V
                            where V.id IN
                            (
                                select B.id
                                from videoforrents, videos B
                                where videoforrents.video_id = B.id and videoforrents.available = 1
                            );"
  end
  def query18
      @vquery = @con.query "select V.title
                            from videos V
                            where V.id NOT IN
                            (
                                select B.id
                                from videoforrents, videos B
                                where videoforrents.video_id = B.id and videoforrents.available = 1
                            );"
  end    
end
