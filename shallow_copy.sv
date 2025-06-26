class header;
	int id;
	
	function new(int id);
		this.id = id;
	endfunction
	
	function display();
		$display("Id is %d", id);
	endfunction
	
endclass

class packet;
	int addr;
	int data;
	
	header h_hand;
	
	function new(int addr, int data, int id);
		this.addr = addr;
		this.data = data;
	endfunction
	
	function display(string name);
		$display("%s : addr = %d data = %d", name, addr, data);
	endfunction
	
endclass

module shallow_tb;
	packet p1,p2;
	
	initial begin
		p1 = new(2,3,1);
		p1.display("p1");
	
		//p2 = new(1,2,3);
		//p2.display("p2");

		//# p1 : addr =           2 data =           3
		//# p2 : addr =           1 data =           2

		//p2 = p1;
		p2 = new p1;

		p2.addr = 4;
		p2.data = 8;
		p1.display("p1");
		p2.display("p2");

		/*# p1 : addr =           2 data =           3
 		  # p1 : addr =           4 data =           8
		  # p2 : addr =           4 data =           8 


                  # p1 : addr =           2 data =           3
		  # p1 : addr =           2 data =           3
		  # p2 : addr =           4 data =           8 */
	end
endmodule
