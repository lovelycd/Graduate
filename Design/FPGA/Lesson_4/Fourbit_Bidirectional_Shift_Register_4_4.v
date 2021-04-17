module Fourbit_Bidirectional_Shift_Register_4_4(input CR0,CLK,S0,S1,DSL,DSR,D0,D1,D2,D3,output Q0,Q1,Q2,Q3);
reg temp_Q0,temp_Q1,temp_Q2,temp_Q3;

	always @(posedge CLK) begin 
			case({S1,S0})
					2'b10:   {temp_Q0,temp_Q1,temp_Q2,temp_Q3}={temp_Q1&CR0,temp_Q2&CR0,temp_Q3&CR0,DSL};
					2'b01:   {temp_Q0,temp_Q1,temp_Q2,temp_Q3}={DSR,temp_Q0&CR0,temp_Q1&CR0,temp_Q2&CR0};
					2'b11:   {temp_Q0,temp_Q1,temp_Q2,temp_Q3}={D0,D1,D2,D3};
					2'b00: 	{temp_Q0,temp_Q1,temp_Q2,temp_Q3}={temp_Q1&CR0,temp_Q1&CR0,temp_Q2&CR0,temp_Q3&CR0};
			endcase 
	end

assign Q0=temp_Q0&CR0;
assign Q1=temp_Q1&CR0;
assign Q2=temp_Q2&CR0;
assign Q3=temp_Q3&CR0;	

endmodule 