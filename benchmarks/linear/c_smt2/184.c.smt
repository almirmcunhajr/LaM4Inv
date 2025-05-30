(set-logic LIA)

( declare-const i Int )
( declare-const i! Int )
( declare-const j Int )
( declare-const j! Int )
( declare-const k Int )
( declare-const k! Int )
( declare-const n Int )
( declare-const n! Int )

( declare-const i_0 Int )
( declare-const i_1 Int )
( declare-const i_2 Int )
( declare-const i_3 Int )
( declare-const j_0 Int )
( declare-const j_1 Int )
( declare-const j_2 Int )
( declare-const j_3 Int )
( declare-const k_0 Int )
( declare-const n_0 Int )

( define-fun inv-f( ( i Int )( j Int )( k Int )( n Int ) ) Bool
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
)

( define-fun pre-f ( ( i Int )( j Int )( k Int )( n Int )( i_0 Int )( i_1 Int )( i_2 Int )( i_3 Int )( j_0 Int )( j_1 Int )( j_2 Int )( j_3 Int )( k_0 Int )( n_0 Int ) ) Bool
	( or
		( and
			( = i i_1 )
			( = j j_1 )
			( = n n_0 )
			( = i_1 0 )
			( = j_1 0 )
			( = n_0 1 )
			( or ( = n_0 1 ) ( = n_0 2 ) )
		)
		( and
			( = i i_1 )
			( = j j_1 )
			( = n n_0 )
			( = i_1 0 )
			( = j_1 0 )
			( not ( = n_0 1 ) )
			( or ( = n_0 1 ) ( = n_0 2 ) )
		)
	)
)

( define-fun trans-f ( ( i Int )( j Int )( k Int )( n Int )( i! Int )( j! Int )( k! Int )( n! Int )( i_0 Int )( i_1 Int )( i_2 Int )( i_3 Int )( j_0 Int )( j_1 Int )( j_2 Int )( j_3 Int )( k_0 Int )( n_0 Int ) ) Bool
	( or
		( and
			( = i_2 i )
			( = j_2 j )
			( = i_2 i! )
			( = j_2 j! )
			( = k k_0 )
			( = k! k_0 )
			( = j j! )
			( = n n! )
		)
		( and
			( = i_2 i )
			( = j_2 j )
			( <= i_2 k_0 )
			( = i_3 ( + i_2 1 ) )
			( = j_3 ( + j_2 n_0 ) )
			( = i_3 i! )
			( = j_3 j! )
			(= k k_0 )
			(= k! k_0 )
			(= n n_0 )
			(= n! n_0 )
		)
	)
)

( define-fun post-f ( ( i Int )( j Int )( k Int )( n Int )( i_0 Int )( i_1 Int )( i_2 Int )( i_3 Int )( j_0 Int )( j_1 Int )( j_2 Int )( j_3 Int )( k_0 Int )( n_0 Int ) ) Bool
	( or
		( not
			( and
				( = i i_2)
				( = j j_2)
				( = k k_0 )
				( = n n_0)
			)
		)
		( not
			( and
				( not ( <= i_2 k_0 ) )
				( > i_2 k_0 )
				( = n_0 1 )
				( not ( = i_2 j_2 ) )
			)
		)
	)
)
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( pre-f i j k n i_0 i_1 i_2 i_3 j_0 j_1 j_2 j_3 k_0 n_0  )
		( inv-f i j k n )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( and
			( inv-f i j k n )
			( trans-f i j k n i! j! k! n! i_0 i_1 i_2 i_3 j_0 j_1 j_2 j_3 k_0 n_0 )
		)
		( inv-f i! j! k! n! )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( inv-f i j k n  )
		( post-f i j k n i_0 i_1 i_2 i_3 j_0 j_1 j_2 j_3 k_0 n_0 )
	)
))

