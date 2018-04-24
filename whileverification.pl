%while_verification_____________________________________________________________
while(G):-
            write("while is being verified"),
            nl,
            cond(G),
            body(G).

cond(G):-
            write("condition is being verified"),
            nl,
            whilecond(G,A,C,B),
            elements(G,A,B).

body(G):-
            write("body is being verified"),
            nl,
            lines(G),
            action(G).

%condition_parts________________________________________________________________

elements(G,A,B):-
            write("condition elements are being verified"),
            nl,
            condelement(G,A),
            condelement(G,B),
            type(G,T,T).

condelement(G,A):-
            write("condition elements are being verified"),
            initelement(A),
            (whilecond(G,A,C,B); whilecond(G,B,C,A)).

%body_parts_____________________________________________________________________


action(G):-
            write("action is being verified"),
            nl,
            ((whilecond(nico,n,'<',p), insielement(G,A),increase(G,A));
            (whilecond(nico,n,'>',p), insielement(G,A),decrease(G,A));
            (whilecond(nico,n,'<',p), insielement(G,B),decrease(G,B));
            (whilecond(nico,n,'>',p), insielement(G,B),increase(G,B));

            (whilecond(nico,n,'==',p), insielement(G,A),(increase(G,A); decrease(G,A)));
            (whilecond(nico,n,'==',p), insielement(G,B),(increase(G,B); decrease(G,B)));

            (whilecond(nico,n,'!=',p), insielement(G,A),approach(G,A,B));
            (whilecond(nico,n,'!=',p), insielement(G,A),approach(G,A,B))).




%facts__________________________________________________________________________

initelement(n).
initelement(p).
whilecond(nico,n,'<',p).
type(nico,int,int).
insielement(nico,n).
increase(nico,n).
lines(nico).
