module tb_dff;

logic clk;

dff_if dff_interface(clk);
dff dut(dff_interface.clk, dff_interface.d, dff_interface.q, dff_interface.qbar);

initial begin
	clk = 0;
	forever #5 clk = ~clk;
end
initial begin
	//drive
	dff_interface.d = 0;
	#10 $display("q = %d, qbar = %d", dff_interface.q, dff_interface.qbar);
	#10 dff_interface.d = 1;
	#10 $display("q = %d, qbar = %d", dff_interface.q, dff_interface.qbar);
	#10 dff_interface.d = 0;
	#10 $display("q = %d, qbar = %d", dff_interface.q, dff_interface.qbar);
	#20 $stop;

end
endmodule
