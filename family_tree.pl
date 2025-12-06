% ============================================================================
% Family Tree Program in Prolog
% ============================================================================
% This program defines family relationships and implements rules to query
% relationships such as parent, grandparent, sibling, and cousin relationships.

% ----------------------------------------------------------------------------
% BASIC RELATIONSHIPS (Facts)
% ----------------------------------------------------------------------------

% Define parent relationships
parent(john, mary).
parent(john, peter).
parent(john, sarah).
parent(mary, david).
parent(mary, emily).
parent(peter, james).
parent(peter, lisa).
parent(sarah, robert).
parent(sarah, anna).
parent(david, michael).
parent(emily, sophia).
parent(james, olivia).
parent(lisa, william).

% Define gender
male(john).
male(peter).
male(david).
male(james).
male(robert).
male(michael).
male(william).

female(mary).
female(sarah).
female(emily).
female(lisa).
female(anna).
female(sophia).
female(olivia).

% Additional family members for more complex relationships
parent(george, john).
parent(george, alice).
parent(helen, john).
parent(helen, alice).
parent(alice, charles).
parent(alice, diana).

male(george).
male(charles).
female(helen).
female(alice).
female(diana).

% ----------------------------------------------------------------------------
% DERIVED RELATIONSHIPS (Rules)
% ----------------------------------------------------------------------------

% Father: X is the father of Y if X is a parent of Y and X is male
father(X, Y) :-
    parent(X, Y),
    male(X).

% Mother: X is the mother of Y if X is a parent of Y and X is female
mother(X, Y) :-
    parent(X, Y),
    female(X).

% Child: Y is a child of X if X is a parent of Y
child(Y, X) :-
    parent(X, Y).

% Son: Y is a son of X if Y is a child of X and Y is male
son(Y, X) :-
    child(Y, X),
    male(Y).

% Daughter: Y is a daughter of X if Y is a child of X and Y is female
daughter(Y, X) :-
    child(Y, X),
    female(Y).

% Grandparent: X is a grandparent of Y using recursion
% Base case: X is a grandparent of Y if X is a parent of Z and Z is a parent of Y
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Grandfather: X is a grandfather of Y if X is a grandparent of Y and X is male
grandfather(X, Y) :-
    grandparent(X, Y),
    male(X).

% Grandmother: X is a grandmother of Y if X is a grandparent of Y and X is female
grandmother(X, Y) :-
    grandparent(X, Y),
    female(X).

% Sibling: X and Y are siblings if they share the same parent
% Note: This includes half-siblings. For full siblings, both parents must match.
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Full sibling: X and Y are full siblings if they share both parents
full_sibling(X, Y) :-
    parent(P1, X),
    parent(P1, Y),
    parent(P2, X),
    parent(P2, Y),
    P1 \= P2,
    X \= Y.

% Brother: X is a brother of Y if X is a sibling of Y and X is male
brother(X, Y) :-
    sibling(X, Y),
    male(X).

% Sister: X is a sister of Y if X is a sibling of Y and X is female
sister(X, Y) :-
    sibling(X, Y),
    female(X).

% Cousin: X and Y are cousins if their parents are siblings
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2),
    X \= Y.

% Uncle: X is an uncle of Y if X is a sibling of Y's parent and X is male
uncle(X, Y) :-
    parent(P, Y),
    sibling(X, P),
    male(X).

% Aunt: X is an aunt of Y if X is a sibling of Y's parent and X is female
aunt(X, Y) :-
    parent(P, Y),
    sibling(X, P),
    female(X).

% ----------------------------------------------------------------------------
% RECURSIVE RELATIONSHIPS
% ----------------------------------------------------------------------------

% Ancestor: X is an ancestor of Y using recursion
% Base case: X is a parent of Y
% Recursive case: X is an ancestor of Y if X is a parent of Z and Z is an ancestor of Y
ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

% Descendant: Y is a descendant of X using recursion
% Base case: Y is a child of X
% Recursive case: Y is a descendant of X if Y is a child of Z and Z is a descendant of X
descendant(Y, X) :-
    child(Y, X).
descendant(Y, X) :-
    child(Y, Z),
    descendant(Z, X).

% ----------------------------------------------------------------------------
% HELPER QUERIES
% ----------------------------------------------------------------------------

% Get all children of a person
% Query: children_of(john, Children).
children_of(Person, Children) :-
    findall(Child, child(Child, Person), Children).

% Get all siblings of a person
% Query: siblings_of(mary, Siblings).
siblings_of(Person, Siblings) :-
    findall(Sibling, sibling(Sibling, Person), Siblings).

% Get all cousins of a person
% Query: cousins_of(david, Cousins).
cousins_of(Person, Cousins) :-
    findall(Cousin, cousin(Cousin, Person), Cousins).

% Get all descendants of a person
% Query: descendants_of(john, Descendants).
descendants_of(Person, Descendants) :-
    findall(Descendant, descendant(Descendant, Person), Descendants).

% Get all ancestors of a person
% Query: ancestors_of(michael, Ancestors).
ancestors_of(Person, Ancestors) :-
    findall(Ancestor, ancestor(Ancestor, Person), Ancestors).

