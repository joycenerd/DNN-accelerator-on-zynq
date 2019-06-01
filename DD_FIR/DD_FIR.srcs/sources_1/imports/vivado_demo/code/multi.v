module multi(
	input wire clk,
	input wire [15:0] coef,
	input wire [15:0] di,
	output reg [31:0] prod
);
	always @(posedge clk) begin
		prod <= coef * di; 
	end
	
endmodule
