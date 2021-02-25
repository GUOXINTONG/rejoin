-- using 1433771997 as a seed to the RNG


select
	s.s_acctbal,
	s.s_name,
	n.n_name,
	p.p_partkey,
	p.p_mfgr,
	s.s_address,
	s.s_phone,
	s.s_comment
from
	part as p,
	supplier as s,
	partsupp as ps,
	nation as n,
	region as r
where
	p.p_partkey = ps.ps_partkey
	and s.s_suppkey = ps.ps_suppkey
	and p.p_size = 38
	and p.p_type like '%TIN'
	and s.s_nationkey = n.n_nationkey
	and n.n_regionkey = r.r_regionkey
	and r.r_name = 'MIDDLE EAST'
--	and ps.ps_supplycost = (
--		select
--			min(ps.ps_supplycost)
--		from
--			partsupp as ps,
--			supplier as s,
--			nation as n,
--			region as r
--		where
--			p.p_partkey = ps.ps_partkey
--			and s.s_suppkey = ps.ps_suppkey
--			and s.s_nationkey = n.n_nationkey
--			and n.n_regionkey = r.r_regionkey
--			and r.r_name = 'MIDDLE EAST'
--	)
order by
	s.s_acctbal desc,
	n.n_name,
	s.s_name,
	p.p_partkey
LIMIT 100;
