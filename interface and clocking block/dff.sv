module dff(
	input logic clk,
	input logic d,
	output logic q,
	output logic qbar
);

always_ff@(posedge clk) begin
	q<=d;
end
assign qbar = ~q;
endmodule
