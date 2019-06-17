module sysctrl(
	input wire clk, 
	input wire rst,
	input wire [1:0]ctrl,
	input wire [35:0] acc,
	output reg RW1,
	output reg RW2,
	output reg [5:0] didx1,
	output reg [5:0] didx2,
	//output reg [3:0] cidx,
	//output reg [15:0] douta,
	output reg acc_en,
	output reg bsy
);
	`include "Param.v"
    reg CS, NS;
	reg [3:0]counter;
	reg cnt_en;

	//next state logic
	always@(*) begin
		case(CS)
			Idle: 
				begin
					if(ctrl[0])
						NS=Calculate;
					else
						NS=Idle;
				end
			Calculate:
				begin
					if(didx2==Depth)
						NS=Idle;
					else
						NS=Calculate;		
				end
			default: 
				begin
					NS=Idle;
				end
		endcase
	end

	//output logic
	always@(*) begin
		case(CS)
			Idle: 
				begin
					RW2=&(~didx2);
					RW1=1'b0;
					acc_en=1'b0;
					cnt_en=1'b0;
					bsy=1'b0;
				end
			Calculate: 
				begin	
					RW2=(~counter[2])&(counter[1])&(counter[0]);
					RW1=&(~counter);
					acc_en=(counter[2])|(~counter[1])|(counter[0]);
					cnt_en=1'b1;
					bsy=1'b1;
				end
			default: 
				begin
					RW1=1'b0;
					RW2=1'b0;
					acc_en=1'b0;
					cnt_en=1'b0;
					bsy=1'b0;
				end
		endcase
	end
	
    //counter
    /*always @(posedge clk or negedge rst)begin
	    if(~rst) begin
		    counter<=4'd0;
		end
		else if(counter[3] | ctrl[1])begin
		    counter<=4'd0;
		end
		else if(cnt_en)begin
		    counter<=counter+1'b1;
		end
	end*/
	always @(posedge clk or negedge rst) begin
		if(~rst) begin
			counter<=4'd0;
		end
		else if(ctrl[1]) begin
			counter <= 4'd0;
		end
		else if(cnt_en) begin
			counter <= counter+1'b1;
		end
	end
	
	//didx2
	/*always @(posedge clk or negedge rst)begin
	    if(~rst) begin
		    didx2<= 6'd0;
		end
		else if(ctrl[1]) begin
			didx2<= 6'd0;
		end
		else if(counter[2]&counter[1]&counter[0]) begin
		    didx2<= didx2+1'b1;
		end
	end*/
	always @(posedge clk or negedge rst) begin
		if(~rst) begin
			didx2 <= 6'd0;
		end
		else if(ctrl[1]) begin
			didx2<= 6'd0;
		end
		else if(counter[2]&counter[1]&counter[0]) begin
		    didx2<= didx2+1'b1;
		end
	end
		
endmodule
