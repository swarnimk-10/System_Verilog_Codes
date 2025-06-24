module pa_2d;
	bit [3:0][7:0] data;
	initial begin
		data = 32'hff015678;
		
		for (int i = 0; i<$size(data); i++)
			$display("Data %d = %b", i, data[i]);
	end
endmodule

//Output : data[0] = 01111000;
//data[1] = 01010110;
//data[2] = 00000001;
//data[3] = 11111111;

//if we print 'data' it will give the entire array.
