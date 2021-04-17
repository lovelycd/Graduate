module Full_Adder_1_3(input En,A0,B0,C0,output S1,C1);
	assign C1=((A0&B0)|(A0&C0)|(B0&C0))&En;
	assign S1=((~A0&~B0&C0  )|( ~A0&B0&~C0  )|( A0&~B0&~C0 )|(A0&B0&C0))&En;
endmodule 