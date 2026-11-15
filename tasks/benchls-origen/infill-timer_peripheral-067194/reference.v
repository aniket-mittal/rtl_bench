module origen_067194 (
    input wire mclk,
    input wire [13:0] per_addr,
    input wire [15:0] per_din,
    input wire per_en,
    input wire [1:0] per_we,
    input wire puc_rst,
    input wire irqacc,
    output reg [15:0] per_dout,
    output wire irq
);

    reg [7:0] sec;
    reg [27:0] cnt50;
    reg pending;
    wire tick;

    // Clock divider
    always @(posedge mclk or posedge puc_rst) begin
        if (puc_rst)
            cnt50 <= 28'b0;
        else if (cnt50 == 28'h2FAF080)
            cnt50 <= 28'b0;
        else
            cnt50 <= cnt50 + 1'b1;
    end

    assign tick = (cnt50 == 28'h2FAF080);

    // Seconds counter
    always @(posedge mclk or posedge puc_rst) begin
        if (puc_rst)
            sec <= 8'b0;
        else if (tick)
            sec <= sec + 1'b1;
    end

    // Interrupt pending flag
    always @(posedge mclk or posedge puc_rst) begin
        if (puc_rst)
            pending <= 1'b0;
        else if (tick)
            pending <= 1'b1;
        else if (irqacc)
            pending <= 1'b0;
    end

    assign irq = pending;

    // Register read
    always @(*) begin
        if (per_en && per_addr == 14'h8B && per_we == 2'b00)
            per_dout = {8'b0, sec};
        else
            per_dout = 16'b0;
    end

endmodule