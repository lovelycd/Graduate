module Semi_Adder_1_2(input En,A0,B0,output S0,C0);
assign S0=(A0^B0)&En;
assign C0=A0&B0;
endmodule 