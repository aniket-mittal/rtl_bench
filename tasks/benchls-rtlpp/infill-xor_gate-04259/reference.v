module rtlpp_04259 (
    input A,
    input B,
    output Y
);

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
assign unknown = 1'bx;

// Signals for internal logic
wire B_combout;
wire A_combout;
wire Y_0_combout;

// Input logic for B
assign B_combout = B;

// Input logic for A
assign A_combout = A;

// LUT logic for Y
assign Y_0_combout = (A_combout & ~B_combout) | (~A_combout & B_combout);

// Output assignment
assign Y = Y_0_combout;

endmodule