module origen_038659(
    input wire [5:0] CMD,
    input wire send_CMD,
    input wire clock,
    input wire [31:0] address,
    input wire reset,
    output reg CMD_out
);

    wire [48:0] mem;
    wire [6:0] CRC;
    wire [31:0] agument;
    reg [7:0] counter;
    reg [1:0] ps, ns;

    assign agument = address;
    assign CRC = (CMD == 6'b000000) ? 7'b1001010 : 7'b1000011;
    assign mem = {1'b0, 1'b1, CMD, agument, CRC, 1'b1, 1'b0};

    always @(posedge clock or posedge reset) begin
        if (reset)
            ps <= 2'b00;
        else
            ps <= ns;
    end

    always @(*) begin
        case (ps)
            2'b00: ns = send_CMD ? 2'b01 : 2'b00;
            2'b01: ns = 2'b10;
            2'b10: ns = (counter == 8'd0) ? 2'b00 : 2'b10;
            default: ns = 2'b00;
        endcase
    end

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            counter <= 8'd0;
            CMD_out <= 1'b0;
        end else begin
            case (ps)
                2'b00: begin
                    counter <= 8'd0;
                    CMD_out <= 1'b0;
                end
                2'b01: counter <= 8'd47;
                2'b10: begin
                    CMD_out <= mem[counter];
                    counter <= counter - 1'b1;
                end
            endcase
        end
    end

endmodule