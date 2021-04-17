module Four_Vote_1_5(input En,A,B,C,D,output Y);
assign Y= (A&B |A&C|A&D|B&C&D)&En;
endmodule 