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
            condelement(G,A),
            condelement(G,B),
            type(A,T),
            type(B,T).


body(G):-
            nl,
            write("body is being verified"),
            nl,
            lines(G),
            action(G).

%condition_parts________________________________________________________________

condelement(G,A):-
            nl,
            write("condition elements are being verified"),
            nl,
            initelement(A),
            (condst(G,A,C,B); condst(G,B,C,A)).

%body_parts_____________________________________________________________________


action(G):-
            nl,
            write("action is being verified"),
            nl,
            ((condst(G,A,'<',B), insielement(G,A),increase(G,A));
             (condst(G,A,'>',B), insielement(G,A),decrease(G,A));
             (condst(G,A,'<',B), insielement(G,B),decrease(G,B));
             (condst(G,A,'>',B), insielement(G,B),increase(G,B));

             (condst(G,A,'==',B), insielement(G,A),(increase(G,A); decrease(G,A)));
             (condst(G,A,'==',B), insielement(G,B),(increase(G,B); decrease(G,B)));

             (condst(G,A,'!=',B), insielement(G,A),approach(G,A,B));
             (condst(G,A,'!=',B), insielement(G,A),approach(G,A,B))).

%for_verification_______________________________________________________________

for(G):-
            nl,
            write("for is being verified"),
            forinit(G),
            while(G),

%for_parts______________________________________________________________________

forinit(G):-
            nl,
            write("for initialization is being verified"),
            initelement(A),
            type(A,T).


%facts__________________________________________________________________________

initelement(par).
initelement(cont).
initelement(n).
condst(loop_1,cont,'<',n).
type(cont,int).
type(n,int).
insielement(loop_1,cont).
insielement(loop_1,par).
increase(loop_1,cont).
lines(loop_1).
