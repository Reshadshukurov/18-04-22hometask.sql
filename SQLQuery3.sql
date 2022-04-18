create database Spotify
use Spotify

create table Artists(
Id int primary key Identity,
Name nvarchar(255),
Surname nvarchar (255)
)
insert into Artists (Name,Surname) values('Eminem','Marshall')

create table Albums(
Id int primary key Identity,
Name nvarchar(255),
MusicCount int
)
insert into Albums (Name,MusicCount) values('MusicToBeMurderedBy',20)


create table Musics(
Id int primary key Identity,
Name nvarchar(255),
ListenerCount int,
ArtistId int references Artists(Id),
AlbumId int references Albums(Id)
)
insert into Musics (Name,ListenerCount,ArtistId,AlbumId) values('Farewell',1000000,1,1),('Lock It Up',500000,1,1),('Marsh',800332,1,1)
--Query1

create view GetMusicInfo
as
select m.Name 'MusicName',art.Name 'ArtistName',a.Name'AlbumName' from Musics as m
join Artists as art on m.ArtistId=art.Id 
join Albums as a on m.AlbumId=a.Id
select * from GetMusicInfo

--Query2
create view GetAlbumInfo
as
select a.Name 'AlbumName',a.MusicCount from Albums as a
select * from GetAlbumInfo
--Query3
create procedure GetAlbumInfoByName (@AlbumName nvarchar(50))
as 
select Name from Musics where AlbumId=(select id from Albums where Name =@AlbumName)
exec GetAlbumInfoByName 

create procedure GetAlbumInfoByNameListenerCount (@ListenerCount int,@MusicsName nvarchar (50))
as 
select * from Albums
where Name=@ListenerCount and @MusicsName>@ListenerCount
exec GetAlbumInfoByName 

--Query4

create procedure MusicIsDeleted
as 
select Delete from Musics where isDeleted='false'
exec MusicIsDeleted








