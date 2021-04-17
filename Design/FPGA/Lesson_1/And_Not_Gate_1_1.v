module  And_Not_Gate_1_1(input En,in1,in2,output out1);
	assign out1=(~(in1&in2))&En;
endmodule
