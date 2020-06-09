<%@page import="java.sql.*"%>
        <%	  
			  try {

				
				Class.forName("com.mysql.jdbc.Driver");
				//new com.mysql.jdbc.Driver();


				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/grabhub?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

				Statement stmt = conn.createStatement();

				String create = "CREATE TABLE IF NOT EXISTS Feedback(Name varchar(20) NOT NULL,Email varchar(20) NOT NULL,How_Find varchar(20),Message varchar(1000))";
				stmt.executeUpdate(create);

				create="CREATE TABLE IF NOT EXISTS Employee(EID INT(6) NOT NULL PRIMARY KEY, NAME VARCHAR(20) NOT NULL, Email VARCHAR(100) NOT NULL UNIQUE, PASSWORD VARCHAR(20) NOT NULL, Address VARCHAR(100) NOT NULL, Phone VARCHAR(10) NOT NULL,Type VARCHAR(1) NOT NULL)";
				stmt.executeUpdate(create);
                                create="ALTER TABLE employee ADD Busy INT";
                                stmt.executeUpdate(create);

				create="CREATE TABLE IF NOT EXISTS Users(UID INT(6) NOT NULL UNIQUE,Name varchar(20) NOT NULL,Email varchar(100) NOT NULL PRIMARY KEY,Password varchar(20) NOT NULL,Phone VARCHAR(10) NOT NULL)";
				stmt.executeUpdate(create);

				create="CREATE TABLE IF NOT EXISTS Restaurant(RID INT(6) NOT NULL PRIMARY KEY,Restaurant_Name varchar(30) NOT NULL UNIQUE,Email varchar(100) NOT NULL ,Address varchar(100) NOT NULL,Contact VARCHAR(10) NOT NULL,Type VARCHAR(1000) NOT NULL,image VARCHAR(100) NOT NULL,Rating VARCHAR(4) NOT NULL,RtnCount INT NOT NULL,Xcoord DOUBLE NOT NULL,Ycoord DOUBLE NOT NULL)";
				stmt.executeUpdate(create);

				create="CREATE TABLE IF NOT EXISTS Menu(RID INT(6) NOT NULL ,IID INT(6) NOT NULL ,IName varchar(30) NOT NULL UNIQUE,IPrice INT(10) NOT NULL ,Description varchar(1000),img varchar(1000),PRIMARY KEY(RID,IID),CONSTRAINT FOREIGN KEY (RID)REFERENCES Restaurant(RID))";
				stmt.executeUpdate(create);
                                create="ALTER TABLE menu ADD COLUMN NVeg INT DEFAULT 0";
                                stmt.executeUpdate(create); 
                                
				create="CREATE TABLE IF NOT EXISTS Orders(OID INT(6) NOT NULL ,UID INT(6) NOT NULL ,RID INT(6) NOT NULL ,IID INT(6) NOT NULL ,Qty INT(6) NOT NULL,PRIMARY KEY(OID,UID,RID,IID),CONSTRAINT FOREIGN KEY (UID) REFERENCES Users(UID),CONSTRAINT FOREIGN KEY (RID,IID) REFERENCES Menu(RID,IID))";
                                stmt.executeUpdate(create);

                                create="CREATE TABLE IF NOT EXISTS Delivery(OID INT(6) NOT NULL ,EID INT(6) NOT NULL ,Xcoord DOUBLE NOT NULL,Ycoord DOUBLE NOT NULL,PRIMARY KEY(OID,EID),CONSTRAINT FOREIGN KEY (OID) REFERENCES Orders(OID),CONSTRAINT FOREIGN KEY (EID) REFERENCES Employee(EID))";
                                stmt.executeUpdate(create);

				create="INSERT INTO Employee values	(1,\'Raj\',\'raj@grabhub.com\',\'raj\',\'Addr1\',\'7896543210\','A',1)";
				stmt.executeUpdate(create);
				create="INSERT INTO Employee values	(2,\'Mike\',\'mike@grabhub.com\',\'mike\',\'Addr2\',\'8796543012\','M',1)";
				stmt.executeUpdate(create);
				create="INSERT INTO Employee values	(3,\'Smith\',\'smith@delivery.grabhub.com\',\'smith\',\'Addr3\',\'7689345210\','D',0)";
				stmt.executeUpdate(create);
				create="INSERT INTO Employee values	(4,\'Prakash\',\'prakash@delivery.grabhub.com\',\'prakash\',\'Addr4\',\'7689345210\','D',0)";
				stmt.executeUpdate(create);
				create="INSERT INTO Employee values	(5,\'Ramesh\',\'ramesh@delivery.grabhub.com\',\'ramesh\',\'Addr5\',\'7689345210\','D',0)";
				stmt.executeUpdate(create);
				create="INSERT INTO Employee values	(6,\'Zareen\',\'zareen@delivery.grabhub.com\',\'zareen\',\'Addr6\',\'7689345210\','D',0)";
				stmt.executeUpdate(create);


				create="INSERT INTO Users values (1,\'Arjya Das\',\'arjyadas@gmail.com\',\'arjya\',\'9876543210\')";
				stmt.executeUpdate(create);
                                create="INSERT INTO Users values (2,\'Pritam Sil\',\'psil23ml@gmail.com\',\'pritam\',\'9876543210\')";
                                stmt.executeUpdate(create);
				create="INSERT INTO Users values (3,\'Koyel Nath\',\'koyelnath@gmail.com\',\'koyel\',\'9876543012\')";
				stmt.executeUpdate(create);
				create="INSERT INTO Users values (4,\'Navin\',\'here444@gmail.com\',\'gunjan\',\'9876345210\')";
				stmt.executeUpdate(create);

				create="INSERT INTO Restaurant values (1,\'Fried N Grill\',\'friedngrill@gmail.com\',\'Addr1\',\'6712356078\',\'Fast food,Burger\',\'img2.jpg\',\'4.7\',389,88.4156,22.5912)";
				stmt.executeUpdate(create);
				create="INSERT INTO Restaurant values (2,\'The Disaster Cafe\',\'disaster@gmail.com\',\'Addr2\',\'8712456678\',\'Fast food,Burger\',\'img3.jpg\',\'4.2\',150,88.4287,22.6123)";
				stmt.executeUpdate(create);
                                create="INSERT INTO Restaurant values (5,\'Biryani Hut\',\'biryanihut@gmail.com\',\'Addr5\',\'7712456078\',\'Biryani,Mughlai\',\'images.jpg\',\'4.5\',580,88.4598,22.5881)";
                                stmt.executeUpdate(create);
				create="INSERT INTO Restaurant values (4,\'Cookie Cafe\',\'cookiecafe@gmail.com\',\'Addr4\',\'8710974678\',\'Dessert\',\'img4.jpg\',\'3.9\',70,88.3684,22.5896)";
				stmt.executeUpdate(create);
                                create="INSERT INTO Restaurant values (3,\'Eat Meet\',\'eatmeet@gmail.com\',\'Addr3\',\'8902456978\',\'Italian,cafe\',\'img5.jpg\',\'4.2\',270,88.4143,22.5841)";
                                stmt.executeUpdate(create);

				
        //Cookie Cafe
        create="INSERT INTO Menu values (4,1,\'Rainbow Pastry\',99,\'Rainbow PastrySix layers vanilla cream topped pastry\',\'rainbow.jpg\',1)";
        stmt.executeUpdate(create);
        
        create="INSERT INTO Menu values (4,2,\'BlackForest Cake\',499,\'2 kg chocolate cake topped with red cherries\',\'blackforest.jpg\',1)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (4,3,\'BlueBerry CheeseCake\',150,\'Cake\',\'blueberry_cheesecake.jpg\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (4,4,\'Red Velvet Cake\',258,\'Cake\',\'redCake.jpg\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (4,5,\'Mint Chocolate chip Smoothie\',109,\'Thick mint smoothie topped with chocolate chips\',\'Mint_Smoothie.jpg\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (4,6,\'RaspBerry Milk Shake\',109,\'Refreshing Raspberry smoothie\',\'berry1.jpg\',0)";
        stmt.executeUpdate(create);
        
        //Fried N Grill
        create="INSERT INTO Menu values (1,1,\'Lobster Salad\',102,\'A light and refreshing lobster salad made with avocados,fresh vegis and fruits\',\'salad.jpg\',1)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (1,2,\'Pork Tonkatsu\',102,\'Japanese Tonkatsu that consists of a breaded, deep-fried/tempura pork cutlet\',\'pork_Tonkatsu.jpeg\',1)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (1,3,\'Paneer Satay\',102,\'Soft paneer pieces roasted with bell pepper and onions\',\'PaneerSatay.JPG\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (1,4,\'Grilled Octopus\',328,\'Octopus grilled with chili Herb oil\',\'octopus.jpg\',1)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (1,5,\'Cheesy Breadsticks\',258,\'Cheese topped healthy garlic bread\',\'cheesy_breadsticks.jpg\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (1,6,\'Roasted Lamb\',549,\'Lamb breast roasted with wild garlic and Rosemary\',\'lamb.jpg\',1)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (1,7,\'Fresh Food Tart\',109,\'Fresh cut Strawberris, Blueberries, Raspberries, Kiwis and cherries\',\'freshfoodtart.jpg\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (1,8,\'Red Velvet Pastry\',109,\'Desert\',\'redCake.jpg\',0)";
        stmt.executeUpdate(create);

        //The Disaster Cafe
        create="INSERT INTO Menu values (2,1,\'Pea Myriad\',99,\'A jelly of fresh peas,drizzled with watercress ,topped with a poached egg and crunchy peas\',\'savoy.jpg\',1)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (2,2,\'Ravioli\',102,\'Crunchy from outside and soft from inside Wonton Wrapped veg Ravioli\',\'wontonWrapperRavioli.jpg\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (2,3,\'Fish Sizzler\',328,\'Spicy fish sizzler serverd with french fries,lime juice and meyo\',\'sizzler.jpg\',1)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (2,4,\'The Disaster Special Burger\',258,\'veg burger served with chips and meyo\',\'vegburger.jpg\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (2,5,\'Whole Chicken Roast\',549,\'mouth watering chicken roast served with brunt tomato and letus\',\'roastedchicken.jpg\',1)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (2,6,\'Green Mousse\',109,\'Fluffy Green mousse prepared with avocado,green tea and mint\',\'musse.jpg\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (2,7,\'Ice Cream\',109,\'3 scoops:decorated with fresh berries\',\'ice.jpg\',0)";
        stmt.executeUpdate(create);


        //Eat Meet
        create="INSERT INTO Menu values (3,1,\'Shrimp Cocktail\',99,\'Shelled, cooked prawns in a cocktail sauce, served in a glass\',\'SHRIMP_COCKTAIL.jpg\',1)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (3,2,\'Veggie Stuffed Finger\',102,\'Deep fried finger stuffed with fresh veggies, Almonds closeup and Cream sauce\',\'finger.jpg\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (3,3,\'Stuffed Squid\',328,\'Squid stuffed with olive, Spanish onion, garlic rice, tomatoes, mint leaves and parsley. Seasoned with black pepper and herbs\',\'stuffed_squid.jpeg\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (3,4,\'Lasagna\',258,\'Cheese Tomato veg lasagne\',\'veg_lasagna.jpg\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (3,5,\'Special Vegan Sandwich\',258,\'Sandwich\',\'vegan_sandwich.jpg\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (3,6,\'Pork Belly\',549,\'Well cooked whole pork belly served with honey lemon sauce\',\'Pork_Belly_JalapenoSlaw.jpg\',1)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (3,7,\'Mint Cheesecake Mousse\',119,\'A perfectly melt-in-your-mouth fluffy, deliciously minty, cheesecake flavored mousse\',\'mint_cheesecake_mousse.png\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (3,8,\'Panna Cotta\',109,\'Italian dessert of sweetened cream thickened with gelatin and molded\',\'panna_cotta.jpg\',0)";
        stmt.executeUpdate(create);

        //Biryani Hut
        create="INSERT INTO Menu values (5,1,\'Special Mutton Biryani\',228,\'served with Raita\',\'mutton_biryani.jpg\',1)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (5,2,\'Veg Awadhi Biyani\',258,\'Biryani Only\',\'vegBir.jpg\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (5,3,\'Chicken Thali\',309,\'Butter chicken,Roti and salads\',\'butterchicken.jpg\',1)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (5,4,\'Shahi Kesar Tukda\',119,\'Desert\',\'shahiTukda.jpg\',0)";
        stmt.executeUpdate(create);

        create="INSERT INTO Menu values (5,5,\'Pesta Phirni\',60,\'Desert\',\'kesar_phirni.jpg\',0)";
                                stmt.close();
				conn.close();
				  
			  
			  }catch(Exception e) {out.println(e);}
        %>