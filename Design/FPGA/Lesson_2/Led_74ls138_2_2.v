module Led_74ls138_2_2(input En,A,B,C,output Y);
	wire Y0N,Y1N,Y2N,Y3N,Y4N,Y5N,Y6N,Y7N;
	Decoder_74hc138_2_1  D721(1,C,B,A,1,0,0,Y0N,Y1N,Y2N,Y3N,Y4N,Y5N,Y6N,Y7N);
	assign Y=(~(Y1N&Y2N&Y4N&Y7N))&En;
endmodule 