SELECT * FROM bookmark;
SELECT * FROM users;
SELECT * FROM shop;
SELECT * FROM item;
SELECT * FROM itemcategory;

delete from item where no > 7;

select b.*, i.name iname, i.picture ipicture, s.name sname, s.picture spicture 
from bookmark b left outer join item i on b.itemNo = i.no 
						left outer join shop s on b.shopNo = s.no 
where b.usersNo = 1;

select b.*, i.name iname, i.picture ipicture, s.name sname, s.picture spicture 
			from bookmark b left outer join item i on b.itemNo = i.no 
				  					left outer join shop s on b.shopNo = s.no 
			where b.usersNo = 1 and b.shopNo = 1;

delete from bookmark;

commit;

insert INTO shop (address, newaddress, name, phone, picture, introduce, longitude, latitude) VALUES('역삼3142', '신역삼4132', '씨유1342', '02-1234-1234', '갓영조2.jpg', '헬헬헬', 127.036618, 37.504);
insert into item (name, count, `oriPrice`, price, discount, `expDate`, picture, `showItem`, `shopNo`, `itemCategoryNo`) 
VALUES('삼각김밥3', 10, 1000, 500,  50, '2017/02/20 09:00', '갓영조3.jpg', 1, 2, 2);
insert INTO users (id, password, gender, location, birth, `managerIdentified`, `shopNo`) VALUES('3@3', '12345', 'male', '역삼', '1990/10/31', 2, 2);
INSERT INTO itemcategory (content) VALUES('삼각김밥류'); 

COMMIT;

SELECT no
  FROM bookmark
 WHERE usersNo = 1 AND itemNo = 6;

SELECT u.*,
       s.address,
       s.newaddress,
       s.name,
       s.phone,
       s.picture,
       s.introduce
  FROM users u LEFT OUTER JOIN shop s ON u.`shopNo` = s.no
 WHERE u.id = '1@1';

INSERT INTO bookmark(`usersNo`,
                     `itemNo`,
                     `shopNo`,
                     `itemCategoryNo`)
     VALUES (1,
             null,
             6,
             itemcategoryno);


DELETE FROM bookmark
      WHERE itemNo = 8 AND usersNo = 1;