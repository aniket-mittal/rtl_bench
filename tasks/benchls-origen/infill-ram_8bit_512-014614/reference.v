module origen_014614 (
    input [15:0] address,
    input [15:0] write16,
    input [7:0] write8,
    input clk,
    input R_WR,
    input enable,
    input eightbit,
    input reset,
    output reg [15:0] read16,
    output reg [7:0] read8
);

    reg [7:0] data [0:511];
    wire [6:0] addr = address[6:0];

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            integer i;
            for (i = 0; i < 128; i = i + 1) begin
                data[i] <= 8'h00;
            end
            data[0] <= 8'h20; data[1] <= 8'h01;
            data[2] <= 8'h22; data[3] <= 8'h02;
            data[4] <= 8'h24; data[5] <= 8'h03;
            data[6] <= 8'h26; data[7] <= 8'h04;
            data[8] <= 8'h28; data[9] <= 8'h05;
            data[10] <= 8'h2A; data[11] <= 8'h06;
            data[12] <= 8'h2C; data[13] <= 8'h07;
            data[14] <= 8'h2E; data[15] <= 8'h08;
        end else if (!enable && !R_WR) begin
            if (eightbit) begin
                data[addr] <= write16[7:0];
                data[addr + 7'd1] <= write16[15:8];
            end else begin
                data[addr] <= write8;
            end
        end
    end

    always @(*) begin
        if (!enable && R_WR) begin
            read16 = {data[addr + 7'd1], data[addr]};
            read8 = data[addr];
        end else begin
            read16 = 16'h0000;
            read8 = 8'h00;
        end
    end

endmodule