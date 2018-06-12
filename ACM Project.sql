create table gameInfo (gameId int primary key identity(100,1), gameName varchar(20) unique,creaters varchar(20) ,
						genre varchar(30) , releaseDate date , descp varchar(2000) );
						
select * from gameInfo;						
drop table gameInfo;						
--------------------------------minReq table------------------------------------------

create table minReq ( gameId int references gameInfo(gameId) primary key, processor varchar(20) , ram int , gpu varchar(20) , directX int , os varchar(20) ,
					freeHddSpace DECIMAL(6 ,3));  
					

select * from minReq;
drop table minReq;


----------------------------------Login-----------------------------------------------
create table login (name varchar(20) unique , email varchar(30)primary key, password varchar(30) , role varchar(10));

select * from login;
drop table login;
 

-------------------------------user details------------------------------------------
--create table userDetails (name varchar(20) unique , email varchar(30) primary Key , password varchar(30) );

--select * from userDetails;
--drop table userDetails;
					
--------------------------------------------------------------------------------------------------------	


-------------------------addGame----------------				

create proc addGame(@gameName varchar(30) , @creaters varchar(20) , @genre varchar(30) , @releaseDate date ,  @descp varchar(2000) , 
					@processor varchar(20) , @ram int ,@gpu varchar(20)  , @directX int , @os varchar(20) , @freeHDDSpace decimal(6,3) )
					
as
	declare 
		@ctr int
	begin
		insert gameInfo values (@gameName , @creaters , @genre , @releaseDate , @descp);
		
		set @ctr = (select gameId from gameInfo where gameName = @gameName);
		
		insert minReq values (@ctr ,@processor , @ram , @gpu , @directX , @os , @freeHDDSpace); 
	end					
	
	
select * from gameInfo;	
select * from minReq;	
	
addGame 'cs go' , 'valve' , 'first-person shooter' , '2012-8-21' , 'abcdlkfjglkfjglkfj',
																	
		'Intel core 2 duo' , 2 , 'intel hd 520' , 9 , 'windows xp' , 15 
			
	
addGame 'total overdose' , 'valve' , 'first-person shooter' , '2005-8-22' , 'abcdlkfjglkfjglkfj',
																	
		'Intel core 2 duo' , 2 , 'intel hd 520' , 9 , 'windows xp' , 5
	
	
------------------------------

------------------------user details-----------------------

  create proc addUser(@name varchar(20) , @email varchar(30) , @password varchar(30) )
as
	begin
		insert login values (@name , @email , @password ,'user');
	end		
	
select * from login	
	
	
addUser 'red' , 'red@gmail.com' , 'red' 
addUser 'blue' , 'blue@gmail.com', 'blue'

 				
 ---------------------------change password-------------------------------				
 
 create proc changePass (@email varchar(30), @newPassword varchar(30))
 as
	begin
		update login set password = @newPassword where email= @email ;
	end
	
	
select * from login;
	
changePass 'red@gmail.com' , 'red' 
------------------------------game image-------------------------------------------------------------	
create table gameImages (gameId  int references gameInfo(gameId), images varbinary(max));
	insert into gameImages (gameId , images) 
SELECT 100,BulkColumn 
FROM Openrowset( Bulk 'E:\abc.jpg', Single_Blob) as img
select * from gameImages;
-------------------------------processor list-------------------------------------------------------
create table processorList( processorId int primary key, processorName varchar(30));
select * from processorList;
alter table processorList add benchmarks int ;


--------------------------------os list----------------------------------
create table osList( osId int primary key, osName varchar(30));

select * from osList;

---------------------------------gpu list-------------------------------
create table gpuList( gpuId int primary key, gpuName varchar(30));

alter table gpuList add benchmarks int ;
---------------------------------direct x list--------------------------

