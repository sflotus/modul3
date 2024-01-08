create database if not exists ss2_vat_tu;
use ss2_vat_tu;
create table sdt(
ma_sdt int primary key auto_increment,
sdt varchar(12) unique
);
create table nha_cc(
ma_ncc int primary key auto_increment,
ten_ncc varchar(50) unique,
dia_chi varchar(255),
ma_sdt int,
foreign key(ma_sdt) references sdt(ma_sdt)
);
create table don_hang(
so_dh int primary key auto_increment,
ngay_dh date,
ma_ncc int unique,
foreign key(ma_ncc) references nha_cc(ma_ncc)
);

create table phieu_nhap(
so_pn int primary key auto_increment,
ngay_nhap date
);
create table phieu_xuat(
so_px int primary key auto_increment,
ngay_xuat date
);
create table vat_tu(
ma_vt int primary key auto_increment,
ten_vt varchar(55)
);
create table vat_tu_phieu_nhap(
so_pn int,
ma_vt int,
dgia_nhap int,
sl_nhap int,
primary key(so_pn,ma_vt),
foreign key(so_pn) references phieu_nhap(so_pn),
foreign key(ma_vt) references vat_tu(ma_vt)
);
create table vat_tu_phieu_xuat(
so_px int,
ma_vt int,
dgia_xuat int,
sl_xuat int,
primary key(so_px,ma_vt),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vt) references vat_tu(ma_vt)
);
create table vat_tu_don_hang(
so_dh int,
ma_vt int,
primary key(so_dh,ma_vt),
foreign key(so_dh) references don_hang(so_dh),
foreign key(ma_vt) references vat_tu(ma_vt)
);

