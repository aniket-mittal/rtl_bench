module origen_083959 (
    input wire clk,
    input wire nrst,
    input wire [8:0] wrdata1,
    input wire [8:0] wrdata2,
    input wire wr1,
    input wire wr2,
    output reg [8:0] value
);

    // State encoding
    localparam IDLE = 2'b00;
    localparam WRITE1 = 2'b01;
    localparam WRITE2 = 2'b10;

    reg [1:0] state;
    reg [8:0] data;

    always @(posedge clk or negedge nrst) begin
        if (~nrst) begin
            value <= 9'b0;
            state <= IDLE;
            data <= 9'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (wr1) begin
                        data <= wrdata1;
                        state <= WRITE1;
                    end else if (wr2) begin
                        data <= wrdata2;
                        state <= WRITE2;
                    end
                end

                WRITE1: begin
                    if (~wr1) begin
                        value <= data;
                        state <= IDLE;
                    end
                end

                WRITE2: begin
                    if (~wr2) begin
                        value <= data;
                        state <= IDLE;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule