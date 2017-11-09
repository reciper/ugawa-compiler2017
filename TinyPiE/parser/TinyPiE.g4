// antlr4 -package parser -o antlr-generated  -no-listener parser/TinyPiE.g4
grammar TinyPiE;

expr: orExpr
      ;
      
orExpr: orExpr Or andExpr
	| andExpr
	;
 
andExpr: andExpr And addExpr
	| addExpr
	;
	
addExpr: addExpr ADDOP mulExpr
	| mulExpr
	;

mulExpr: mulExpr MULOP unaryExpr
	| unaryExpr
	;

unaryExpr: VALUE			# literalExpr
	| IDENTIFIER			# varExpr
	| '(' expr ')'			# parenExpr
	| SUBOP unaryExpr    # subExpr
	;

Or   : '|';
And : '&';
ADDOP: '+';
MULOP: '*'|'/';
SUBOP: '-'|'~';
IDENTIFIER: 'x'|'y'|'z';
VALUE: [0]|[1-9][0-9]*;
WS: [ \t\r\n] -> skip;
