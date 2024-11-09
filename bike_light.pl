0.50::str(dry);
0.30::str(wet);
0.20::str(snow_covered).

0.30::flw.
0.90::b.
0.95::k.

% CPT de R
0.20::r :-   flw, str(dry).
0.01::r :- \+flw, str(dry).
0.50::r :-   flw, str(wet).
0.05::r :- \+flw, str(wet).
0.80::r :-   flw, str(snow_covered).
0.10::r :- \+flw, str(snow_covered).

% CPT de V
0.20::v :-   r.
0.99::v :- \+r.

% CPT de Li
0.99 ::li :-   v,   b,   k.
0.01 ::li :-   v,   b, \+k.
0.01 ::li :-   v, \+b,   k.
0.001::li :-   v, \+b, \+k.
0.30 ::li :- \+v,   b,   k.
0.005::li :- \+v,   b, \+k.
0.005::li :- \+v, \+b,   k.
0.00 ::li :- \+v, \+b, \+k.

% Alternativa (e) da questão 1
evidence(str(snow_covered),true).
query(v).