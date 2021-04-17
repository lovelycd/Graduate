module Digital_Tube_Decoder_2_6(input En,A0,A1,A2,A3,output a,b,c,d,e,f,g,dp);	

	reg [7:0] temp_D;

	always case({A3,A2,A1,A0}) 
		4'b0000:  temp_D =8'h3f;
		4'b0001:	  temp_D =8'h06;
		4'b0010:  temp_D =8'h5b;
		4'b0011:  temp_D =8'h4f;
		4'b0100:  temp_D =8'h66;
		4'b0101:  temp_D =8'h6d;
		4'b0110:  temp_D =8'h7d;
		4'b0111:  temp_D =8'h07;
		4'b1000:  temp_D =8'h7f;
		4'b1001:  temp_D =8'h6f;
		4'b1010:  temp_D =8'h77;
		4'b1011:  temp_D =8'h7c;
		4'b1100:  temp_D =8'h39;
		4'b1101:  temp_D =8'h5e;
		4'b1110:  temp_D =8'h79;
		4'b1111:   temp_D =8'h71;
	endcase 
	assign {a,b,c,d,e,f,g,dp}=temp_D&{En,En,En,En,En,En,En,En};
endmodule 