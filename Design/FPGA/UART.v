/*****CLK:计时读取电平
		***	RxD:接收数据的端口
		***TxD:发送数据的端口
		***Data_R:接收到的数据
		***Data_T:要发送的数据
		***status:
		******/
module UART(tclk,BaudRate, En_T,RXD,TXD,DATA_T,DATA_R,intr_rcive); 	
input tclk;
input [19:0] BaudRate;
input RXD;
output [7:0] DATA_R;
input En_T;
input [7:0] DATA_T;
output TXD;
output intr_rcive;


UART_R     UR1(tclk,BaudRate,RXD,DATA_R,intr_rcive);
UART_T    UT1(En_T,tclk,BaudRate,TXD,DATA_T);
endmodule 


////////////////////////////////////////   串口接收///////////////////////////////////////////////////////////
module UART_R(tclk,BaudRate,RXD,DATA_R,intr_rcive);
input tclk;
input [19:0] BaudRate;
input RXD;
output reg [7:0] DATA_R;
output reg intr_rcive;

reg En_CLK=0;
  reg [2:0] CStatus=3'b011;
  reg [2:0] NStatus=3'b001;
 reg [3:0] n_bit=4'b0001;
 wire CLK;
  wire CLK0;
assign CLK0=~CLK;
BaudRate_Clk   BCLSdasff(En_CLK,tclk,BaudRate,CLK);

always @(posedge CLK0) begin  				//status change 
	case (NStatus)
		//3'b000: if(n_bit==4'b0000) begin   CStatus=3'b000;NStatus=3'b001; end									//起始位
		3'b001: if((n_bit>4'b0000)&(n_bit<4'b1000))  CStatus=3'b001;else NStatus=3'b010;				//数据位
		3'b010: if(n_bit==4'b1001) begin CStatus=3'b010;NStatus=3'b011;	end												//校验位
		3'b011: if((n_bit>4'b1001)&(n_bit<4'b1100)) CStatus=3'b011; else NStatus=3'b001;//停止位
		default :begin 		CStatus=3'b011;NStatus=3'b001;										end
	endcase
	end
	
always @(negedge RXD or  posedge CLK0) begin


	if(CLK0)  begin
							if(({CStatus,NStatus}==6'b011001 ) &(n_bit>4'hb)) begin En_CLK=0; end
						end
	if(~RXD) begin En_CLK=1; end
	end

always @(negedge CLK0)										//operate
	case({CStatus,NStatus})
		6'b001001:	begin  DATA_R[n_bit-1]=RXD;n_bit=n_bit+1;	intr_rcive=0;	end //字节0-6
		6'b001010:  	begin  DATA_R[n_bit-1]=RXD;n_bit=n_bit+1;		end //字节7
		6'b010011:		begin  n_bit=n_bit+1;end		//校验字
		6'b011011:		begin  n_bit=n_bit+1;end 		//第一个结束bit
		6'b011001:		begin  n_bit=4'b0001;intr_rcive=1;end		//第二个结束bit
		default :		begin n_bit=4'b0001;end
	endcase
	
endmodule 

////////////////////////////////////////////////////////////////////////////////////////////////////////

module UART_T(En,tclk,BaudRate,TXD,DATA_T,CLK,En_CLK,CStatus,NStatus,n_bit,tclk_temp);
input En,tclk;
input [19:0] BaudRate;
input [7:0] DATA_T;
output reg TXD=1;
output reg [2:0] CStatus=3'b100;
output reg [2:0] NStatus=3'b000;
output reg En_CLK=0;
output reg [3:0] n_bit=4'b0000;
wire Parity;
output wire CLK;
output tclk_temp;

Parity_Check pasdfasdf(DATA_T,Parity) ;
BaudRate_Clk   BCLSdf(En_CLK,tclk,BaudRate,CLK,tclk_temp);
always @(posedge CLK) 
	case (NStatus)
		3'b000: 		if(n_bit==4'b0000)  begin
										CStatus=3'b000;
										NStatus=3'b001;
							end
		3'b001:     if((n_bit<4'b1000)&(n_bit>4'b0000)) 	CStatus=3'b001;
							else NStatus=3'b010;
		3'b010:    if(n_bit==4'b1001)  begin CStatus=3'b010;NStatus = 3'b011;end
		3'b011:	if((n_bit>4'b1001)&(n_bit<4'b1011))   CStatus=3'b011;
							else NStatus=3'b100;
		3'b100:    begin CStatus=3'b100;NStatus=3'b000;		end

		default: begin 
									CStatus=3'b100;NStatus=3'b000;
							end
		endcase
	
always @(negedge En or negedge CLK) begin
	if(~En) En_CLK=1;
	else if(~CLK) begin
						if({CStatus,NStatus}==6'b100000)   En_CLK=0;
						end

	end
										
always @(negedge CLK)  begin
			case({CStatus,NStatus}) 
				6'b000001: begin n_bit=4'b0000;TXD=0;  n_bit=n_bit+1; end
				6'b001001: begin  TXD=DATA_T[n_bit-1];  n_bit=n_bit+1;end
				6'b001010: begin  TXD=DATA_T[n_bit-1];  n_bit=n_bit+1;end
				6'b010011: begin  TXD=Parity;n_bit=n_bit+1; end
				6'b011011: begin  TXD=1; n_bit=n_bit+1;end
				6'b011100: begin   TXD=1;n_bit=n_bit+1;end			
				
				6'b100000:begin n_bit=4'b0000;end
				
				default: n_bit=4'b0000;
				endcase
			end
endmodule 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module BaudRate_Clk(En_CLK,tclk,BaudRate,CLK,tclk_temp);		//波特率一半的时候时钟跳变
input tclk;
input [19:0] BaudRate;
input En_CLK;
output reg CLK=0;

output wire tclk_temp;
reg [19:0] ntime=217;

assign tclk_temp=En_CLK&tclk;
always @(posedge tclk_temp) begin
			ntime=ntime-1;
			if(!ntime) begin
				CLK=~CLK;
				ntime=217;
				end
			end
endmodule 
//////////////////////////////////奇偶校验///////////////////////////////////////////////
module Parity_Check(input [7:0] DATA_T,output reg Parity) ;   //0为偶，1为奇
reg[7:0] temp;
always begin
	temp=DATA_T;
	temp=temp^(temp>>4);
	temp=temp^(temp>>2);
	temp=temp^(temp>>1);
	Parity=temp[0]&1'b1;
	end
endmodule 
