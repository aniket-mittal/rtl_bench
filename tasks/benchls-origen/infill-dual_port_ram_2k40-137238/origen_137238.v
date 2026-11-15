module origen_137238 (
    input RCLK,
    input RCLKE,
    input RE,
    input [10:0] RADDR,
    input WCLK,
    input WCLKE,
    input WE,
    input [10:0] WADDR,
    input [15:0] MASK,
    input [39:0] WDATA,
    output reg [39:0] RDATA
);

    // Define the RAM array
    reg [39:0] ram [0:2047];

    // Initialize RAM with zeros
    integer i;
    initial begin
        for (i = 0; i < 2048; i = i + 1) begin
            ram[i] = 40'b0;
        end
    end

    // Read operation
    always @(posedge RCLK) begin
        if (RCLKE && RE) begin
            RDATA <= ram[RADDR];
        end
    end

    // Write operation
    [MASKED]

endmodule