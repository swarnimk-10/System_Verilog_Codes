class constraints_ex;
	rand bit [7:0] min_val, med_val, max_val;
	
	constraint range_exp{0 < min_val; 
						med_val > min_val; 
						max_val < 128;}
endclass

module const_tb;
	constraints_ex c;
	initial begin
		c = new();
		c.randomize();
		$display("min = %d, med = %d, max = %d", c.min_val, c.med_val, c.max_val);
	end
endmodule
