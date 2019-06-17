module fir(
    input wire clk,
    input wire rst,
	input wire [1:0] ctrl,
	input wire [15:0] addr,
    input wire [15:0] din,
    output wire [15:0] dout,
	output wire bsy
);
	wire RW1,RW2;
	wire [13:0] cidx;
	wire [5:0]  didx1,didx2;
	wire [15:0] coef, di, douta;
	wire [15:0] prod;
	wire [15:0] acc;
	wire acc_en;
	wire [15:0] a,b,select;
	wire fin;
	
	sysctrl ctrl_m(
		.clk(clk), 
		.rst(rst),
		.ctrl(ctrl),
		.acc(acc),
		.RW1(RW1),
		.RW2(RW2),
		.didx1(didx1),
		.didx2(didx2),
		//.cidx(cidx),
		//.douta(douta),
		.acc_en(acc_en),
		.bsy(bsy)
	);
	
	/*dbuf buff_in(
		.clk(clk), 
		.din((bsy)?douta:din),
		.didx((bsy)?didx2:addr[7:2]),
		.RW(RW2),
		.di(dout),
		.a(a),
		.b(b),
		.select(select),
		.finish(fin)
	);*/
	/*multi mult_m(
					.in_a(a),
					.in_b(b),
					.out(dout)
				);*/
	accumulator acc_m(
					.a(a),
					.b(b),
					.sub(0),
					.s(dout)
				);
	/*always @(posedge clk or negedge rst) begin
		if(fin==1'b1) begin
			if(select[0]) begin
				multi mult_m(
					.in_a(a),
					.in_b(b),
					.out(dout)
				);
			end
			else if(select[1]) begin 
				accumulator acc_m(
					.a(a),
					.b(b),
					.sub(0),
					.s(dout)
				);
			end
		end
	end*/
	
	
	/*multi mult_m(
		.clk(clk),
		.prod(prod), // out
		.coef(coef),	// in_a
		.di(di)	// in_b
	);*/
	
	/*accumulator acc_m(
		.clk(clk), 
		.prod(prod),
		.acc(acc),
		.acc_en(acc_en)
	);*/

endmodule