-- using 1433771997 as a seed to the RNG


select
	s.s_name,
	s.s_address
from
	supplier as s,
	nation as n
where
--	s_suppkey in (
--		select
--			ps_suppkey
--		from
--			partsupp
--		where
--			ps_partkey in (
--				select
--					p_partkey
--				from
--					part
--				where
--					p_name like 'frosted%'
--			)
--			and ps_availqty > (
--				select
--					0.5::fixeddecimal * sum(l_quantity)
--				from
--					lineitem
--				where
--					l_partkey = ps_partkey
--					and l_suppkey = ps_suppkey
--					and l_shipdate >= date '1994-01-01'
--					and l_shipdate < date '1994-01-01' + interval '1' year
--			)
--	)
    s.s_nationkey = n.n_nationkey
	and n.n_name = 'IRAN'
order by
	s.s_name;

