module origen_040698(
    input CLK_50M,
    input RS232_DCE_RXD,
    input BTN_SOUTH,
    output reg [7:0] LED
);

wire reset = BTN_SOUTH;
wire rxd = RS232_DCE_RXD;

reg [15:0] clock_count;
reg serclk;
reg receiving;
reg parity;
reg [15:0] buffer;

always @(posedge CLK_50M or posedge reset) begin
    if (reset) begin
        clock_count <= 16'd0;
        serclk <= 1'b1;
        receiving <= 1'b0;
        parity <= 1'b0;
        buffer <= 16'd0;
        LED <= 8'h00;
    end else begin
        if (clock_count == 16'd5207) begin
            clock_count <= 16'd0;
            serclk <= ~serclk;
        end else begin
            clock_count <= clock_count + 1'b1;
            if (clock_count == 16'd3254) serclk <= 1'b0;
        end

        if (!receiving && !rxd) begin
            receiving <= 1'b1;
            clock_count <= 16'd0;
            serclk <= 1'b1;
            buffer <= 16'd0;
            parity <= 1'b0;
        end else if (receiving && !serclk) begin
            buffer <= {rxd, buffer[15:1]};
            parity <= parity ^ rxd;
            
            if (buffer[0] == 1'b0 && buffer[9] == 1'b1) begin
                receiving <= 1'b0;
                if (buffer[9:1] == {1'b1, buffer[7:1] ^ {7{^buffer[7:1]}}, 1'b0}) begin
                    LED <= buffer[8:1];
                end else begin
                    LED <= 8'hFF;
                end
            end
        end
    end
end

endmodule