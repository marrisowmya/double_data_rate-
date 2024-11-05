module ddr (
    input clk, rst,
    input  data_in,
    output reg  q1, q2
    
);

//wire i1, i2;

// Flip-flop controlled by the positive edge of clk
always @(posedge clk) begin
    if (rst)
        q1 <= 1'b0;
    else
        q1 <= data_in; 
end

// Flip-flop controlled by the negative edge of clk
always @(negedge clk) begin
    if (rst)
        q2 <= 1'b0;
    else
        q2 <= data_in; 
end

// Internal signals for q1 and q2
//assign i1 = q1;
//assign i2 = q2;

// qout logic
//assign qout = (q1 & ~clk) | (q2 & clk);

endmodule

module ddrm( i1,i2,clk,qout);
input i1,i2,clk;
output qout;

ddr m(qout,q1,q2,clk);
endmodule
