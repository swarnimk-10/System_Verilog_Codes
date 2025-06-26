class header;
  int id;

  function new(int id);
    this.id = id;
  endfunction

  function header copy();
  header temp = new(this.id); // ✅ Create temp object using constructor
  return temp;                // ✅ Return it
endfunction


  function void display();
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
    this.h_hand = new(id);
  endfunction

  function void display(string name);
    $display("%s : addr = %d data = %d id = %d", name, addr, data, h_hand.id);
  endfunction

  function packet copy();
  packet p = new(this.addr, this.data, this.h_hand.id);
  p.h_hand = this.h_hand.copy();  // DEEP COPY HERE
  return p;
endfunction

endclass


module deep_tb;
	packet p1,p2;

	initial begin
		p1 = new(2,3,1);
		p1.display("p1");
	
		//p2 = new p1; //shallow copy
		p2 = p1.copy();

		p2.addr = 4;
		p2.data = 8;
		p2.h_hand.id = 6;
		p1.display("p1");
		p2.display("p2");

		/*# p1 : addr =           2 data =           3 id =           1
		  # p1 : addr =           2 data =           3 id =           6
		  # p2 : addr =           4 data =           8 id =           6 

		  p2 id is reflected in p1. so to copy the internal nested handles 
		  between two objects we use deep copy.*/
		
		
	end
endmodule
