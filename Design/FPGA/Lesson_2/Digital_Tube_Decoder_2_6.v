module Digital_Tube_Decoder_2_6(input En,A0,A1,A2,A3,output a,b,c,d,e,f,g,dp);	

	reg [7:0] temp_D;

	always case({A3,A2,A1,A0}) 
		4'b0000:  temp_D =8'b11111100;
		4'b0001:	  temp_D =8'b01100000;
		4'b0010:  temp_D =8'b11011010;
		4'b0011:  temp_D =8'b11110010;
		4'b0100:  temp_D =8'b01100110;
		4'b0101:  temp_D =8'b10110110;
		4'b0110:  temp_D =8'b10111110;
		4'b0111:  temp_D =8'b11100000;
		4'b1000:  temp_D =8'b11111110;
		4'b1001:  temp_D =8'b11110110;
		4'b1010:  temp_D =8'b11101110;
		4'b1011:  temp_D =8'b00111110;
		4'b1100:  temp_D =8'b10011100;
		4'b1101:  temp_D =8'b01111010;
		4'b1110:  temp_D =8'b10011110;
		4'b1111:   temp_D =8'b10001110;
	endcase 
	assign {a,b,c,d,e,f,g,dp}=temp_D&{En,En,En,En,En,En,En,En};
endmodule 