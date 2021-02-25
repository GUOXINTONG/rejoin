select
	s.s_acctbal AS s_acctbal,
	s.s_name AS s_name,
	n.n_name AS n_name,
	ps.ps_partkey AS ps_partkey,
	p.p_mfgr as p_mfgr,
	s.s_address as s_address,
	s.s_phone as s_phone,
	s.s_comment as s_comment
from
	part AS p,
	supplier AS s,
	partsupp AS ps,
	nation AS n,
	region AS r
where	
	p.p_partkey = ps.ps_partkey
	and s.s_suppkey = ps.ps_suppkey
	and p.p_size = 38
	and p.p_type like '%TIN'
	and s.s_nationkey = n.n_nationkey
	and n.n_regionkey = r.r_regionkey
	and r.r_name = 'MIDDLE EAST'
order by
	s_acctbal desc,
	n_name,
	s_name,
	ps_partkey
LIMIT 100;
	
