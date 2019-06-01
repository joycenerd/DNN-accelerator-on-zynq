module accumulator(
	input wire clk, 
	input wire [31:0] prod,
    input wire acc_en,
	output reg [35:0] acc
);
	
    always @(posedge clk) begin
		acc <= {{4{prod[31]}},prod[31:0]} + ((acc_en)?acc:0);
	end


endmodule
