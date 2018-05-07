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
            assign(T,G);
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
            assign(T,ifl);
            if(R,ifl)).



ellines(G):-
            nl,
            write("else lines are being verified"),
            nl,
            (linest(G,ell);
            while(P,ell);
            for(Q,ell);
            assign(T,ell);
            if(R,ell)).

%assignment_verification________________________________________________________

assign(G,L):-
            nl,
            write("assignment is being verified"),
            nl,
            initelement(A),
            initelement(B),
            type(A,J),
            type(B,J),
            assignst(G,A,'=',B),
            location(G,L).






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
assignst(loop_assign,var1,=,var2).
location(loop_assign,main).
%program_test___________________________________________________________________

initelement(array).
type(array,int).
initelement(other).
type(other,int).
inielement(n).
type(n,int).
initelement(e).
type(e,int).
initelement(i).
type(i,int).
condst(for_ani,i,<,n).
location(for_ani,main).
insielement(for_ani,i).
increase(for_ani,i).
linest(for_ani).
condst(if_ani,array,<,n).
location(if_ani,for_ani).
linest(if_ani,ifl).
insielement(if_ani,array).
linest(if_ani,ell).
insielement(if_ani,array).
condst(while_ani,e,<,n).
location(while_ani,main).
linest(while_ani).
insielement(while_ani,e).
increase(while_ani,e).
%not_working____________________________________________________________________
