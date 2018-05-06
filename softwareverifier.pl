%while_verification_____________________________________________________________
while(G,L):-
            nl,
            write("while is being verified"),
            nl,
            cond(G),
            body(G),
            location(G,L).

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


lines(G):-
            nl,
            write("lines are being verified"),
            nl,
            (linest(G);
            while(P,G);
            for(Q,G);
            if(R,G)).

%for_verification_______________________________________________________________

for(G,L):-
            nl,
            write("for is being verified"),
            nl,
            forinit(G),
            while(G,L),
            location(G,L).

forinit(G):-
            nl,
            write("for initialization is being verified"),
            nl,
            initelement(A),
            type(A,T).


%if_verification________________________________________________________________
if(G,L) :-
			nl,
      write('if is being verified'),
      nl,
			cond(G),
      bodyif(G),
      bodyelse(G),
      location(G,L).

bodyif(G):-
            nl,
            write("if body is being verified"),
            nl,
            iflines(G).

bodyelse(G):-
            nl,
            write("else body is being verified"),
            nl,
            ellines(G).

iflines(G):-
            nl,
            write("if lines are being verified"),
            nl,
            (linest(G,ifl);
            while(P,ifl);
            for(Q,ifl);
            if(R,ifl)).



ellines(G):-
            nl,
            write("else lines are being verified"),
            nl,
            (linest(G,ell);
            while(P,ell);
            for(Q,ell);
            if(R,ell)).

%assignment_verification________________________________________________________

assign(G):-
            nl,
            write("assignment is being verified"),
            nl,
            inielement(A),
            inielement(B),
            type(A,J),
            type(B,J),
            assignst(A,B).

%facts_while____________________________________________________________________

initelement(par).
type(par,int).
initelement(cont).
type(cont,int).
initelement(n).
type(n,int).
location(loop_while,main).
condst(loop_while,cont,'<',n).
insielement(loop_while,cont).
insielement(loop_while,par).
increase(loop_while,cont).
linest(loop_while).


%facts_for______________________________________________________________________

initelement(sum).
type(sum,int).
initelement(Num).
type(Num,int).
initelement(i).
type(i,int).
condst(loop_for,i,<,Num).
insielement(loop_for,sum).
increase(loop_for,sum).
insielement(loop_for,i).
increase(loop_for,i).
linest(loop_for).
location(loop_for,main).

%facts_if_______________________________________________________________________

initelement(i).
type(i,int).
initelement(j).
type(j,int).
condst(loop_if,i,'<',j).
linest(loop_if,ifl).
linest(loop_if,ell).
location(loop_if,main).

%facts_assignment_______________________________________________________________
initelement(var1).
type(var1,int).
inielement(var2).
type(var2,int).
assignst(var1,var2).
