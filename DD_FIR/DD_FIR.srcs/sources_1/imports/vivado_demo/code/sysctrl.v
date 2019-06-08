module sysctrl(
	input wire clk, 
	input wire rst,
	input wire [1:0]ctrl,
	input wire [35:0] acc,
	output reg RW1,
	output reg RW2,
	output reg [5:0] didx1,
	output reg [5:0] didx2,
	output reg [3:0] cidx,
	output reg [15:0] douta,
	output reg acc_en,
	output reg bsy
);
	`include "Param.v"
    reg CS, NS;
	reg [3:0]counter;
	reg cnt_en;
	
	
	 
	 
    //counter
    always @(posedge clk or negedge rst)begin
	    if(~rst) begin
		    counter<=4'd0;
		end
		else if(counter[3] | ctrl[1])begin
		    counter<=4'd0;
		end
		else if(cnt_en)begin
		    counter<=counter+1'b1;
		end
	end
	
	//didx2
	always @(posedge clk or negedge rst)begin
	    if(~rst) begin
		    didx2<= 6'd0;
		end
		else if(ctrl[1]) begin
			didx2<= 6'd0;
		end
		else if(counter[2]&counter[1]&counter[0]) begin
		    didx2<= didx2+1'b1;
		end
	end
		
endmodule
