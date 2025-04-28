<Q1>
mysql> CREATE TABLE `departments`(
    ->     department_id INT unsigned NOT NULL PRIMARY KEY auto_increment,
    ->     name VARCHAR(20) NOT NULL,
    ->     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ->     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP                        
    ->  );


<Q2>
ALTER TABLE people ADD department_id INT unsigned AFTER email;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0


<Q3>
mysql> INSERT INTO departments(name)
    -> VALUES
    -> ('営業'),
    -> ('開発'),
    -> ('経理'),
    -> ('人事'),
    -> ('情報システム');


mysql> INSERT INTO people (name, email, age, gender)
    -> VALUES
    -> ('ねむお','hane@beyond-works.co.jp', 69, 1),
    -> ('ねむお','hanet@beyond-works.co.jp', 62, 2),
    -> ('ねむお','haneo@beyond-works.co.jp', 50, 1),
    -> ('ねむお','hanee@beyond-works.co.jp', 40, 1),
    -> ('ねむお','hanes@beyond-works.co.jp', 44, 2),
    -> ('ねむお','haneg@beyond-works.co.jp', 45, 1),
    -> ('ねむお','hanek@beyond-works.co.jp', 76, 1),
    -> ('ねむお','haneq@beyond-works.co.jp', 66, 2),
    -> ('ねむお','hanei@beyond-works.co.jp', 61, 2),
    -> ('ねむお','hanem@beyond-works.co.jp', 60, 1);


mysql> INSERT INTO reports (person_id, content)
    -> VALUES
    -> (15,'君が手を差し伸べた光で影が生まれる'),
    -> (16,'歌って聞かせてこの話の続き'),
    -> (17,'連れて行って見たことない星まで'),
    -> (18,'誰の手も声も届かない高く聳え立った塔の上へ'),
    -> (19,'飛ばすフウセンカズラ'),
    -> (20,'僕は君に笑って欲しいんだ'),
    -> (21,'満たされない穴は惰性の会話や澄ましたポーズで'),
    -> (22,'これまでは埋めてきたけど'),
    -> (23,'退屈な日々を蹴散らして');        


<Q4>
mysql> UPDATE people SET department_id = '5' WHERE person_id = 1;

mysql> UPDATE people SET department_id = '5' WHERE person_id = 2;

mysql> UPDATE people SET department_id = '4' WHERE person_id = 3;

mysql> UPDATE people SET department_id = '4' WHERE person_id = 4;

mysql> UPDATE people SET department_id = '5' WHERE person_id = 7;

mysql> UPDATE people SET department_id = '5' WHERE person_id = 8;

mysql> UPDATE people SET department_id = '1' WHERE person_id = 9;

mysql> UPDATE people SET department_id = '1' WHERE person_id = 11;

mysql> UPDATE people SET department_id = '1' WHERE person_id = 12;

mysql> UPDATE people SET department_id = '1' WHERE person_id = 13;


<Q5>
mysql> SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;


<Q6>
peopleテーブルから、department_id = 1 であるレコードを探し、その中の name、email、ageのデータを取り出す。さらに、結果created_at;の値で並び替える。


<Q7>
mysql> SELECT name
    -> FROM people
    -> WHERE (gender = 2 AND age BETWEEN 20 AND 29)
    ->    OR (gender = 1 AND age BETWEEN 40 AND 49);



<Q8>
mysql> SELECT name, age
    -> FROM people
    -> WHERE department_id = 1
    -> ORDER BY age ASC;



<Q9>
mysql> SELECT AVG(age) AS average_age
    -> FROM people
    -> WHERE department_id = 2 AND gender = 2 ;


<Q10>
mysql> SELECT 
    -> people.name,
    -> departments.department_id,
    -> reports.content
    -> FROM 
    -> people
    -> INNER JOIN 
    -> departments ON people.department_id = departments.department_id
    -> INNER JOIN 
    -> reports ON people.person_id = reports.person_id;


<Q11>
mysql> SELECT 
    -> people.name
    -> FROM 
    -> people
    -> LEFT JOIN 
    -> reports ON people.person_id = people.person_id
    -> WHERE 
    -> reports.person_id IS NULL;