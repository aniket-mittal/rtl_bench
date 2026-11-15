module origen_079863 #(
    parameter ADDR_WIDTH = 32,
    parameter NUM_DEVICES = 8
) (
    input [ADDR_WIDTH-1:0] virtual_addr,
    output reg [ADDR_WIDTH-1:0] phys_addr,
    output reg [NUM_DEVICES-1:0] device_en
);

    // Device address ranges
    localparam [ADDR_WIDTH-1:0] ROM_LOW  = 32'h00000000, ROM_HIGH  = 32'h0000FFFF;
    localparam [ADDR_WIDTH-1:0] RAM_LOW  = 32'h00010000, RAM_HIGH  = 32'h0001FFFF;
    localparam [ADDR_WIDTH-1:0] VGA_LOW  = 32'h00020000, VGA_HIGH  = 32'h0002FFFF;
    localparam [ADDR_WIDTH-1:0] PS2_LOW  = 32'h00030000, PS2_HIGH  = 32'h0003FFFF;
    localparam [ADDR_WIDTH-1:0] ACP_LOW  = 32'h00040000, ACP_HIGH  = 32'h0004FFFF;
    localparam [ADDR_WIDTH-1:0] CPU_LOW  = 32'h00050000, CPU_HIGH  = 32'h0005FFFF;

    // Device IDs
    localparam ROM_ID = 0, RAM_ID = 1, VGA_ID = 2, PS2_ID = 3, ACP_ID = 4, CPU_ID = 5;

    always @(*) begin
        // Default values
        phys_addr = {ADDR_WIDTH{1'b0}};
        device_en = {NUM_DEVICES{1'b0}};

        // Priority-encoded address translation
        if (virtual_addr >= ROM_LOW && virtual_addr <= ROM_HIGH) begin
            phys_addr = virtual_addr;
            device_en[ROM_ID] = 1'b1;
        end
        else if (virtual_addr >= RAM_LOW && virtual_addr <= RAM_HIGH) begin
            phys_addr = virtual_addr - RAM_LOW;
            device_en[RAM_ID] = 1'b1;
        end
        else if (virtual_addr >= VGA_LOW && virtual_addr <= VGA_HIGH) begin
            phys_addr = virtual_addr - VGA_LOW;
            device_en[VGA_ID] = 1'b1;
        end
        else if (virtual_addr >= PS2_LOW && virtual_addr <= PS2_HIGH) begin
            phys_addr = virtual_addr - PS2_LOW;
            device_en[PS2_ID] = 1'b1;
        end
        else if (virtual_addr >= ACP_LOW && virtual_addr <= ACP_HIGH) begin
            phys_addr = virtual_addr - ACP_LOW;
            device_en[ACP_ID] = 1'b1;
        end
        else if (virtual_addr >= CPU_LOW && virtual_addr <= CPU_HIGH) begin
            phys_addr = virtual_addr - CPU_LOW;
            device_en[CPU_ID] = 1'b1;
        end
    end

endmodule