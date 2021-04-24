module Full_Adder_74hc153_2_5(input En,A1,B1,C0,output S1,C1);
	wire S10,C10;
	Dual_MUX_74hc173_2_3   DM_74_23_1(1,0,C0,~C0,~C0,C0,A1,B1,0,C0,C0,1,0,S10,C10);
	assign S1=S10&En;
	assign C1=C10&En;
endmodule 
