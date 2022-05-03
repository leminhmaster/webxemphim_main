drop database if exists `ql_phim`;
create database ql_phim character set utf8mb4 collate utf8mb4_general_ci;
use ql_phim;
#bảng quốc gia
create table quocgia (
maquocgia varchar(10) NOT NULL Primary key,
tenquocgia varchar(50) character set utf8mb4 not null unique
)engine = InnoDB default charset=latin1;

#bảng danh mục
create table danhmuc (
madanhmuc int auto_increment primary key,
tendanhmuc varchar(50) character set utf8mb4 not null unique,
mota text character set utf8mb4
)engine = InnoDB;

#bảng thể loại
create table theloai (
matheloai int auto_increment primary key,
tentheloai varchar(50) character set utf8mb4 not null unique,
mota text character set utf8mb4
)engine = InnoDB;

#bảng seri phim
create table seriphim(
maseriphim int auto_increment primary key,
seriphim varchar(50) character set utf8mb4 not null unique
)engine = InnoDB;

#bảng Rating (đọ tuổi để xem phim)
create table rating(
marating varchar(5) character set utf8 primary key,
rating varchar(50) character set utf8mb4 not null unique
)engine = InnoDB;

#bảng thông tin phim
create table ttphim (
mabophim varchar(20) not null primary key,
tenbophim varchar(100) character set utf8mb4 not null,
tomtatphim text character set utf8mb4,
namphathanh varchar(5) not null,
ngaycapnhat datetime not null default(curdate()),
sotap bigint not null,
linkanh text not null,
trangthai tinyint not null,# 1 là: sắp chiếu, 2 là: đang chiếu 
tongluotxem bigint not null default(0),
thoiluong varchar(20),
lichchieu varchar(100) character set utf8mb4, 
ghichu text character set utf8mb4,
maquocgia varchar(10) not null references quocgia(maquocgia),
madanhmuc int not null references danhmuc(madanhmuc),
maseriphim int not null references seriphim(maseriphim),
marating varchar(5) not null references rating(marating)
)engine= InnoDB default charset=latin1;

#bảng thông tin thể loại của từng bộ phim
create table theloaiphim(
mabophim varchar(20) not null references ttphim(mabophim),
matheloai int not null references theloai(matheloai),
primary key(mabophim,matheloai)
)engine=InnoDB default charset= latin1;

#bảng các loại tập phim như trailer, các tập phim chinh ,OVA..
create table loaitapphim(
maloaitp int auto_increment primary key,
loaitp varchar(20) character set utf8 not null unique
)engine=InnoDB;

#bảng các tập phim
create table tttapphim(
matapphim bigint auto_increment primary key,
mabophim varchar(20) not null references ttphim(mabophim),
maloaitp int not null references loaitapphim(maloaitp),
tentapphim varchar(100) character set utf8mb4 not null,
luotxem bigint not null default(0),
tpso int not null,
linkanhtp text character set utf8 not null,
trangthai tinyint not null
)engine=InnoDB;

#bảng lưu thông tin máy chủ chứa các tập phim
create table maychuphim(
mamaychu int auto_increment primary key,
tenmaychu varchar(10) character set utf8 not null unique
)engine = InnoDB;

#bảng lưu lại chất lượng của video phim 240P,360P,480P....
create table chatluongphim(
machatluong int auto_increment primary key,
chatluong varchar(10) character set utf8 not null unique
)engine = InnoDB;

#bảng lưu lại link của từng tập phim
create table linkphim(
matapphim bigint not null references tttapphim(matapphim),
mamaychu int not null references maychuphim(mamaychu),
machatluong int not null references chatluongphim(machatluong),
linkphim text character set utf8 not null,
trangthai tinyint not null,
primary key(matapphim,mamaychu,machatluong)
)engine InnoDB;

#bảng tài khoản của người dùng
create table taikhoan(
id bigint auto_increment primary key,
username varchar(255) not null,
pass varchar(24) not null,
email varchar(255) not null,
tennguoidung varchar(50) character set utf8mb4 not null,
linkavatar varchar(255) character set latin1,
ismember boolean not null,
trangthai tinyint not null
)engine=InnoDB default charset = latin1;

#bảng lưu bình luận của người dùng
create table binhluan(
mabl bigint auto_increment primary key,
mabophim varchar(20) not null references ttphim(mabophim),
id bigint not null references taikhoan(id),
mabltl bigint references binhluan(mabl),
ngaydang datetime not null default(curdate()),
binhluan text character set utf8mb4 not null,
trangthai tinyint not null
)engine=InnoDB;

#bảng lưu đanh giá người xem và đánh dấu theo dõi
create table danhgia(
mabophim varchar(20) not null references ttphim(mabophim),
id bigint not null references taikhoan(id),
diemdanhgia int,
dangtheodoi bool
)engine=InnoDB;

#bảng lưu lại phản hồi của người xem
create table phanhoi(
maphanhoi bigint auto_increment primary key,
id bigint not null references taikhoan(id),
tieudephanhoi varchar(100) character set utf8mb4 not null,
thoigiantaophanhoi datetime not null default(curdate()),
noidungphanhoi text character set utf8mb4 not null
)





