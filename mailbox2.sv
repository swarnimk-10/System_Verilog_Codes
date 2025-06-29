module mailbox_ex;

	mailbox mbox;
	int data;
	
	initial begin
		mbox = new();
		
		fork
  begin
    for (int i = 0; i < 5; i++) begin
	#5; // small delay
      $display("sending data %0d", i);
      mbox.put(i);
      
    end
  end

  begin
    for (int i = 0; i < 5; i++) begin
      #5; // small delay
      mbox.get(data);
      $display("received data %0d", data);
    end
  end
join

	end
endmodule
/* Output :
# sending data 0
# received data 0
# sending data 1
# received data 1
# sending data 2
# received data 2
# sending data 3
# received data 3
# sending data 4
# received data 4
*/
