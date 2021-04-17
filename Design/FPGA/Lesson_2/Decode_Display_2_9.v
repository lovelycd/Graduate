module Decode_Display_2_9(input En,A0,A1,output a,b,c,d,e,f,g,dp);
	reg [7:0] temp;
	always case({A1,A0})
		2'b00:   temp=8'b11111100;
		2'b01:   temp=8'b00000010;
		2'b10:   temp=8'b00010010;
		2'b11:   temp=8'b10010010;
	endcase 
	assign {a,b,c,d,e,f,g,dp}=temp&{En,En,En,En,En,En,En,En};
endmodule 