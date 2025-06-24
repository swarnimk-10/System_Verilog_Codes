module queue_example;
	int q1[$];
	int q2[$];

	initial begin
		q1 = '{1,2,3,4,5};
		$display("q1 is %p", q1);
		
		//insert function
		q1.insert(1,10);
		$display("q1 is %p", q1);
		
		q1.push_front(9);
		$display("q1 is %p", q1);

		q1.push_back(31);
		$display("q1 is %p", q1);

		q1.delete(6); //index = 6
		$display("q1 is %p", q1);
	
		q1.pop_front();
		$display("q1 is %p", q1);
	end
endmodule

/*
# q1 is '{1, 2, 3, 4, 5}
# q1 is '{1, 10, 2, 3, 4, 5}
# q1 is '{9, 1, 10, 2, 3, 4, 5}
# q1 is '{9, 1, 10, 2, 3, 4, 5, 31}
# q1 is '{9, 1, 10, 2, 3, 4, 31}
# q1 is '{1, 10, 2, 3, 4, 31}
*/
