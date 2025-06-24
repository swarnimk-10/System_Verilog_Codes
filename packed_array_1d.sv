//1D packed array

module example;
	bit [7:0] data;
	initial begin
		data = 8'b11011001;
		
		for (int i = 0; i<$size(data); i++)
			$display("Data %d = %b", i, data[i]);
	end
endmodule
