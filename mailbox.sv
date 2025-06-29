module mailbox_ex;

	mailbox mbox;
	int data;
	
	initial begin
		mbox = new();
		
		fork begin
			for(int i = 0; i<5; i++) begin
				$display("sending data %d", i);
				mbox.put(i);
			end
		     end
		     begin
			for(int i = 0; i<5; i++) begin
				mbox.get(data);
				$display("recieved data %d", data);
			end
		     end
		join 
	end
endmodule
/* Output :
# sending data           0
# sending data           1
# sending data           2
# sending data           3
# sending data           4
# recieved data           0
# recieved data           1
# recieved data           2
# recieved data           3
# recieved data           4
*/

/*
when i wrote: 
for (int i = 0; i < 5; i++) begin
    $display("received data %d", data);
    mbox.get(data);
end

i got output : 
# sending data           0
# sending data           1
# sending data           2
# sending data           3
# sending data           4
# recieved data           0
# recieved data           0
# recieved data           1
# recieved data           2
# recieved data           3

because i was displaying data before calling get.
So for the first iteration, data still holds its initial value (0).
Then get() assigns a new value after it has already been displayed.
*/
