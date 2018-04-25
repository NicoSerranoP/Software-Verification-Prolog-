%while_verification_____________________________________________________________
while(G):-
            nl,
            write("while is being verified"),
            nl,
            cond(G),
            body(G).

cond(G):-
            nl,
            write("condition is being verified"),
            nl,
            elements(G,A,B).

body(G):-
            nl,
            write("body is being verified"),
            nl,
            lines(G),
            action(G).

%condition_parts________________________________________________________________

elements(G,A,B):-
            nl,
            write("condition elements are being verified"),
            nl,
            condelement(G,A),
            condelement(G,B),
            type(G,T,T).

condelement(G,A):-
            nl,
            write("condition elements are being verified"),
            initelement(A),
            (whilecond(G,A,C,B); whilecond(G,B,C,A)).

%body_parts_____________________________________________________________________


action(G):-
            nl,
            write("action is being verified"),
            nl,
            ((whilecond(G,A,'<',B), insielement(G,A),increase(G,A));
             (whilecond(G,A,'>',B), insielement(G,A),decrease(G,A));
             (whilecond(G,A,'<',B), insielement(G,B),decrease(G,B));
             (whilecond(G,A,'>',B), insielement(G,B),increase(G,B));

             (whilecond(G,A,'==',B), insielement(G,A),(increase(G,A); decrease(G,A)));
             (whilecond(G,A,'==',B), insielement(G,B),(increase(G,B); decrease(G,B)));

             (whilecond(G,A,'!=',B), insielement(G,A),approach(G,A,B));
             (whilecond(G,A,'!=',B), insielement(G,A),approach(G,A,B))).



%facts__________________________________________________________________________

initelement(par).
initelement(cont).
initelement(n).
whilecond(loop_1,cont,'<',n).
type(loop_1,int,int).
insielement(loop_1,cont).
insielement(loop_1,par).
increase(loop_1,cont).
lines(loop_1).
