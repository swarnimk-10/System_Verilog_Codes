module semaphore_ex;
  semaphore s;

  task task1();
    $display("task1: waiting to get token");
    s.get(1);
    $display("task1: got token");
    #10;
    s.put(1);
  endtask

  task task2();
    $display("task2: waiting to get token");
    s.get(1);
    $display("task2: got token");
    #5;
    s.put(1);
  endtask

  initial begin
    s = new(1);
    fork
      task1();
      task2();
    join
  end
endmodule

/*
# task1: waiting to get token
# task1: got token
# task2: waiting to get token
# task2: got token
*/

/*
s.put(1); removed in task1

# task1: waiting to get token
# task1: got token
# task2: waiting to get token

s.try_get(1) for task2. it wont wait for task1
*/

