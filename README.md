# Assignment-8-Building-a-Family-Tree-in-Prolog

## Overview
This program implements a comprehensive family tree system in Prolog that represents relationships between family members using facts and rules. It demonstrates logical inference and recursive queries within Prolog.

## Files
- `family_tree.pl` - Main Prolog program with facts and rules
- `queries.txt` - Sample queries with expected outputs
- `report.md` - Implementation report (APA 7 format)

## How to Run

### Using SWI-Prolog:
1. Start SWI-Prolog
2. Load the program: `consult('family_tree.pl').`
3. Run queries from `queries.txt`

### Example:
```prolog
?- consult('family_tree.pl').
?- parent(john, mary).
true

?- children_of(john, Children).
Children = [mary, peter, sarah]

?- cousin(david, james).
true
```

## Features
- Basic relationships: parent, male, female
- Derived relationships: grandparent, sibling, cousin, uncle, aunt
- Recursive relationships: ancestor, descendant
- Helper queries for convenient access

## Family Structure
The program includes a sample family tree with multiple generations to demonstrate various relationship queries.

