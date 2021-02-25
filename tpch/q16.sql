-- using 1433771997 as a seed to the RNG


select
	p.p_brand,
	p.p_type,
	p.p_size
--	count(distinct ps.ps_suppkey) as supplier_cnt
--    count(ps.ps_suppkey) as supplier_cnt
from
	partsupp as ps,
	part as p
where
	p.p_partkey = ps.ps_partkey
	and p.p_brand <> 'Brand#45'
	and p.p_type not like 'SMALL PLATED%'
--	and p.p_size in (19, 17, 16, 23, 10, 4, 38, 11)
--	and ps.ps_suppkey not in (
--		select
--			s.s_suppkey
--		from
--			supplier as s
--		where
--			s.s_comment like '%Customer%Complaints%'
--	)
group by
	p.p_brand,
	p.p_type,
	p.p_size
order by
--	supplier_cnt desc,
	p.p_brand,
	p.p_type,
	p.p_size;

