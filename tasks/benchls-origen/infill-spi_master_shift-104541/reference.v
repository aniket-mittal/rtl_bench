module origen_104541 (
    input wire clk,
    input wire MISOx,
    output wire MOSIx,
    input wire reset,
    input wire [7:0] d,
    output reg [7:0] q,
    output wire cs,
    output wire sck
);

    reg [2:0] counter;
    reg [2:0] cnt;
    reg qdelayed;

    // Clock generation
    always @(posedge clk or posedge reset) begin
        if (reset)
            counter <= 3'b000;
        else
            counter <= counter + 1'b1;
    end

    assign sck = counter[1];

    // SPI transaction counter
    always @(negedge sck or posedge reset) begin
        if (reset)
            cnt <= 3'b000;
        else
            cnt <= cnt + 1'b1;
    end

    // Data transmission (MOSI)
    assign MOSIx = (cnt == 3'b000) ? d[7] : qdelayed;

    // Data reception (MISO) and delayed q
    always @(posedge sck or posedge reset) begin
        if (reset) begin
            q <= 8'b0;
            qdelayed <= 1'b0;
        end
        else begin
            if (cnt == 3'b000)
                q <= d;
            else begin
                q <= {q[6:0], MISOx};
                qdelayed <= q[7];
            end
        end
    end

    // Chip select (not used in this implementation)
    assign cs = 1'b0;

endmodule