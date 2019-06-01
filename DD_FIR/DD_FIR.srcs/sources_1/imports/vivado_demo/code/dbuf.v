module dbuf(
	input wire clk, 
	input wire [15:0] din, //input
	input wire [5:0] didx, //address
	input wire RW,
	output reg [15:0] di
);
	reg [15:0] mem [0:63];

	// dbuf
	always @(posedge clk) begin 
		if(RW) 
			mem[didx] <= din; 
		
		di <= RW ? din:mem[didx];
	end

endmodule




