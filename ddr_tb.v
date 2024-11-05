module ddr_tb();

    // Declare the testbench signals
    reg clk, rst;
    reg [3:0] data_in;
    wire [3:0]q1, q2, qout;

    // Instantiate the Device Under Test (DUT)
    ddr DUT (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .q1(q1),
        .q2(q2),
        .qout(qout)
    );

    // Clock generation
    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk; // 20 time units clock period
    end

    // Reset task
    task rst_dut();
    begin
        rst = 1'b1;
        @(posedge clk); // wait for one clock edge
        #20;
        rst = 1'b0;
    end
    endtask

    // Data input task
    task inputs(input [3:0] in_data);
    begin
        @(posedge clk);
        data_in = in_data;
    end
    endtask

    // Test sequence
    initial begin
        // Apply reset
        rst_dut();

        // Apply different input values with some delay
        inputs(4'd2);
        #10;
        inputs(4'd4);
        #10;
        inputs(4'd5);
        #10;
        inputs(4'd8);
    end
endmodule
