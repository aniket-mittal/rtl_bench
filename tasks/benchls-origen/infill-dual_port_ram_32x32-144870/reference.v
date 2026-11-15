module origen_144870 (
    input wire [4:0] A1ADDR,
    input wire [31:0] A1DATA,
    input wire A1EN,
    input wire CLK1,
    input wire [4:0] B1ADDR,
    output reg [31:0] B1DATA
);

reg [31:0] mem [0:31];

initial begin
    integer i;
    for (i = 0; i < 32; i = i + 1) begin
        mem[i] = 32'b0;
    end
end

always @(posedge CLK1) begin
    if (A1EN) begin
        mem[A1ADDR] <= A1DATA;
    end
    B1DATA <= mem[B1ADDR];
end

`ifdef FPGA_DEVICE_A
specify
    $setup(A1ADDR, posedge CLK1, 2);
    $setup(A1DATA, posedge CLK1, 2);
    $setup(A1EN, posedge CLK1, 2);
    $setup(B1ADDR, posedge CLK1, 2);
    $hold(posedge CLK1, A1ADDR, 1);
    $hold(posedge CLK1, A1DATA, 1);
    $hold(posedge CLK1, A1EN, 1);
    $hold(posedge CLK1, B1ADDR, 1);
    (CLK1 => B1DATA) = 3;
endspecify
`endif

`ifdef FPGA_DEVICE_B
specify
    $setup(A1ADDR, posedge CLK1, 1.5);
    $setup(A1DATA, posedge CLK1, 1.5);
    $setup(A1EN, posedge CLK1, 1.5);
    $setup(B1ADDR, posedge CLK1, 1.5);
    $hold(posedge CLK1, A1ADDR, 0.5);
    $hold(posedge CLK1, A1DATA, 0.5);
    $hold(posedge CLK1, A1EN, 0.5);
    $hold(posedge CLK1, B1ADDR, 0.5);
    (CLK1 => B1DATA) = 2;
endspecify
`endif

endmodule