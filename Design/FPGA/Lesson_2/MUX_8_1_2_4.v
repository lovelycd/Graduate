module MUX_8_1_2_4(input En,A0,A1,A2,D0,D1,D2,D3,D4,D5,D6,D7,output Y);
wire Y1,Y2;
	Dual_MUX_74hc173_2_3   DM173_23_1(1,A0,A1,A2,~A2,D0,D1,D2,D3,D4,D5,D6,D7,Y1,Y2);
assign Y=(Y1|Y2)&En;
endmodule 

	