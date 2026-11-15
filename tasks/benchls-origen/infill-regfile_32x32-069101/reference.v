module origen_069101 (
    input wire clk,
    input wire rst,
    input wire [4:0] r1_addr,
    input wire [4:0] r2_addr,
    input wire [4:0] rd1_addr,
    input wire [4:0] rd2_addr,
    input wire [31:0] rd1_data,
    input wire [31:0] rd2_data,
    output reg [31:0] r1_data,
    output reg [31:0] r2_data
);

    reg [31:0] r [0:31];
    integer i;

    // Asynchronous read with read-after-write hazard resolution
    always @(*) begin
        if (r1_addr == 5'b00000)
            r1_data = 32'b0;
        else if (r1_addr == rd1_addr)
            r1_data = rd1_data;
        else if (r1_addr == rd2_addr)
            r1_data = rd2_data;
        else
            r1_data = r[r1_addr];
    end

    always @(*) begin
        if (r2_addr == 5'b00000)
            r2_data = 32'b0;
        else if (r2_addr == rd1_addr)
            r2_data = rd1_data;
        else if (r2_addr == rd2_addr)
            r2_data = rd2_data;
        else
            r2_data = r[r2_addr];
    end

    // Synchronous write and reset
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1)
                r[i] <= 32'b0;
        end
        else begin
            if (rd1_addr != 5'b00000)
                r[rd1_addr] <= rd1_data;
            if (rd2_addr != 5'b00000)
                r[rd2_addr] <= rd2_data;
        end
    end

endmodule