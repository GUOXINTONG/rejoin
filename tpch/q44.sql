-- using 1433771997 as a seed to the RNG


select
	s.s_name,
	s.s_address,
	c.c_name,
	r.r_name
from
	supplier as s,
	nation as n,
	customer as c,
	orders as o,
	region as r
where
    s.s_nationkey = n.n_nationkey
	and n.n_name = 'IRAN'
	and s.s_nationkey = c.c_nationkey
	and o.o_custkey = c.c_custkey
	and o.o_totalprice > 10000
	and r.r_regionkey = n.n_regionkey
order by
	s.s_name
limit 100;

