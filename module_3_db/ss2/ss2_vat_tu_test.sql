use ss2_vat_tu;
select * from vat_tu as A
left join vat_tu_don_hang as b on A.ma_vt=b.ma_vt
left join don_hang as C on b.so_dh = c.so_dh
left join nha_cc  as d  on  c.ma_ncc = d.ma_ncc
where a.ma_vt=1 or d.ma_ncc=1;