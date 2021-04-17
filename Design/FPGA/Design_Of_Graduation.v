module Design_Of_Graduation(tclk,RXD,DATA_R ,intr_rcive,logic_output);

input tclk,RXD;
output  [7:0] DATA_R;
output intr_rcive;												// uart byte receive interrupt bit  

output reg [15:0] logic_output=0;					//led output
 
 reg  [2:0] n_byte=0; 
 reg [15:0] logic_input;		//key input
 reg [7:0] exp_selc;		//experiment select code
 reg trans_finish=0; 					//the siginal of the whole command  receive finish
wire En_11,En_12,En_13,En_14,En_15;
wire En_21,En_22,En_23,En_24,En_25,En_26,En_27,En_28,En_29;
wire En_31,En_32,En_33,En_34,En_35,En_36;
wire En_41,En_42,En_43,En_44,En_45,En_46;								//the enable bit of every single experiment

UART_R wesdfgh(tclk,115200,RXD,DATA_R,intr_rcive);			//uart receive data module 

expe_select expe_select1(exp_selc[7:0],En_11,En_12,En_13,En_14,En_15,
				En_21,En_22,En_23,En_24,En_25,En_26,En_27,En_28,En_29,
				En_31,En_32,En_33,En_34,En_35,En_36,
				En_41,En_42,En_43,En_44,En_45,En_46);									//enable corresponding experiment based on the command byte

always @(posedge intr_rcive) begin													// wait for the finish of uart receivement
	   case(n_byte)
			3'b000:	if(DATA_R!=8'hAA) n_byte=0;else begin  n_byte=n_byte+1;trans_finish=0;end
			3'b001:	begin exp_selc=DATA_R;n_byte=n_byte+1; end
			3'b010:	begin logic_input[15:8]=DATA_R;n_byte=n_byte+1;end
			3'b011:	begin logic_input[7:0]=DATA_R;n_byte=n_byte+1;end
			3'b100:  begin if(DATA_R==8'h55) begin n_byte=0;trans_finish=1;end else n_byte=0;  end
			default : n_byte=0;
		endcase
end




wire output_1_11;
And_Not_Gate_1_1 asdfaadfswefa(En_11,logic_input[0],logic_input[1],output_1_11);

always @(posedge trans_finish)
		case(exp_selc)
			8'h11:  begin  logic_output[0]=output_1_11;              end
		endcase

endmodule 