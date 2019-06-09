module dbuf(
	input wire clk, 
	input wire [15:0] din, //input
	input wire [5:0] didx, //address
	input wire RW,
	output reg [15:0] di
	output reg[15:0] a,
	output reg[15:0] b,
	output reg[15:0] select,
	output finish;
);
	reg [15:0] mem [0:63];
	// dbuf
	always @(posedge clk) begin 
		if(RW) begin
			mem[didx] <= din;
			if(didx==5'd0) begin 
				a<=din;
			end
			else if(didx[0]) begin 
				b<=din;
			end
			else if(didx[1]) begin 
				select<=din;
			end
		end 
		
		di <= RW ? din:mem[didx];
		finish<=(didx[2])?1:0;

	end

endmodule




