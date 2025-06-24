module upa;
	logic [2:0] a [1:0];
	initial begin
		a = '{3'b001, 3'b011};
		foreach(a[i])
			$display("Data at %d is %b",i,a[i]);
	end
endmodule 

// Data at 1 is 001
// Data at 0 is 011
