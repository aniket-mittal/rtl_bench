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
    always @(posedge WCLK) begin
        if (WCLKE && WE) begin
            if (MASK[0]) ram[WADDR][2:0] <= WDATA[2:0];
            if (MASK[1]) ram[WADDR][5:3] <= WDATA[5:3];
            if (MASK[2]) ram[WADDR][8:6] <= WDATA[8:6];
            if (MASK[3]) ram[WADDR][11:9] <= WDATA[11:9];
            if (MASK[4]) ram[WADDR][14:12] <= WDATA[14:12];
            if (MASK[5]) ram[WADDR][17:15] <= WDATA[17:15];
            if (MASK[6]) ram[WADDR][20:18] <= WDATA[20:18];
            if (MASK[7]) ram[WADDR][23:21] <= WDATA[23:21];
            if (MASK[8]) ram[WADDR][26:24] <= WDATA[26:24];
            if (MASK[9]) ram[WADDR][29:27] <= WDATA[29:27];
            if (MASK[10]) ram[WADDR][32:30] <= WDATA[32:30];
            if (MASK[11]) ram[WADDR][35:33] <= WDATA[35:33];
            if (MASK[12]) ram[WADDR][38:36] <= WDATA[38:36];
            if (MASK[13]) ram[WADDR][39] <= WDATA[39];
            if (MASK[14]) ram[WADDR][39] <= WDATA[39];
            if (MASK[15]) ram[WADDR][39] <= WDATA[39];
        end
    end

endmodule