module da;
	int dyn1[];  //32 bits
	int dyn2[];
	
	initial begin
		dyn1 = new[5];
		dyn1 = '{1,2,3,4,5};
		dyn2 = dyn1;

		$display("Array 1 is: %p", dyn1);
		$display("Array 2 is: %p", dyn2);
		foreach(dyn1[i])
			$display("Dyn1[%d] = %d", i, dyn1[i]);  //dyn1[0] = 1
		dyn2[2] = 8;
		$display("Array 1 is: %p", dyn1);
		$display("Array 2 is: %p", dyn2);

		dyn1 = new[10](dyn1);   //5 old + 5 empty
		$display("Array 1 is: %p", dyn1);
		$display("Array 2 is: %p", dyn2);
		
		dyn1 = new[10];
		$display("Array 1 is: %p", dyn1);
		$display("Array 2 is: %p", dyn2);

		$display("Size od dyn 1 = %d", dyn1.size());
		dyn2.delete();
		$display("Array 1 is: %p", dyn1);
		$display("Array 2 is: %p", dyn2);

	end
endmodule

/*
Outputs
# Array 1 is: '{1, 2, 3, 4, 5}
# Array 2 is: '{1, 2, 3, 4, 5}
# Dyn1[          0] =           1
# Dyn1[          1] =           2
# Dyn1[          2] =           3
# Dyn1[          3] =           4
# Dyn1[          4] =           5
# Array 1 is: '{1, 2, 3, 4, 5}
# Array 2 is: '{1, 2, 8, 4, 5}
# Array 1 is: '{1, 2, 3, 4, 5, 0, 0, 0, 0, 0}
# Array 2 is: '{1, 2, 8, 4, 5}
# Array 1 is: '{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
# Array 2 is: '{1, 2, 8, 4, 5}
# Size od dyn 1 =          10
# Array 1 is: '{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
# Array 2 is: '{}
*/
