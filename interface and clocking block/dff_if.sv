interface dff_if(input clk);

logic d,q,qbar;

modport dut(input d,clk, output q,qbar);
modport tb(clocking cb);

clocking cb@(posedge clk);
	input q;
	input qbar;
	output d;
endclocking

endinterface
