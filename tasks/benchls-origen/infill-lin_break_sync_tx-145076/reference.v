module origen_145076 (
    input wire clk,
    input wire reset,
    input wire [7:0] data,
    output reg tx
);

    localparam IDLE = 3'b000;
    localparam BREAK = 3'b001;
    localparam SYNC = 3'b010;
    localparam DATA = 3'b011;
    localparam CHECKSUM = 3'b100;

    reg [2:0] state;
    reg [3:0] bit_count;
    reg [7:0] shift_reg;
    reg [7:0] checksum;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            bit_count <= 0;
            shift_reg <= 8'h00;
            checksum <= 8'h00;
            tx <= 1'b1;
        end else begin
            case (state)
                IDLE: begin
                    state <= BREAK;
                    bit_count <= 0;
                    tx <= 1'b0;
                end
                BREAK: begin
                    if (bit_count == 13) begin
                        state <= SYNC;
                        bit_count <= 0;
                        shift_reg <= 8'h55; // Sync byte
                        tx <= 1'b1;
                    end else begin
                        bit_count <= bit_count + 1;
                    end
                end
                SYNC: begin
                    if (bit_count == 10) begin
                        state <= DATA;
                        bit_count <= 0;
                        shift_reg <= data;
                        checksum <= data;
                    end else begin
                        tx <= shift_reg[0];
                        shift_reg <= {1'b0, shift_reg[7:1]};
                        bit_count <= bit_count + 1;
                    end
                end
                DATA: begin
                    if (bit_count == 10) begin
                        state <= CHECKSUM;
                        bit_count <= 0;
                        shift_reg <= ~checksum;
                    end else begin
                        tx <= shift_reg[0];
                        shift_reg <= {1'b0, shift_reg[7:1]};
                        bit_count <= bit_count + 1;
                    end
                end
                CHECKSUM: begin
                    if (bit_count == 10) begin
                        state <= IDLE;
                    end else begin
                        tx <= shift_reg[0];
                        shift_reg <= {1'b0, shift_reg[7:1]};
                        bit_count <= bit_count + 1;
                    end
                end
            endcase
        end
    end
endmodule

module lin_receiver (
    input wire clk,
    input wire reset,
    input wire rx,
    output reg [7:0] data
);

    localparam IDLE = 3'b000;
    localparam BREAK = 3'b001;
    localparam SYNC = 3'b010;
    localparam DATA = 3'b011;
    localparam CHECKSUM = 3'b100;

    reg [2:0] state;
    reg [3:0] bit_count;
    reg [7:0] shift_reg;
    reg [7:0] checksum;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            bit_count <= 0;
            shift_reg <= 8'h00;
            checksum <= 8'h00;
            data <= 8'h00;
        end else begin
            case (state)
                IDLE: begin
                    if (rx == 1'b0) begin
                        state <= BREAK;
                        bit_count <= 0;
                    end
                end
                BREAK: begin
                    if (rx == 1'b1) begin
                        if (bit_count >= 11) begin
                            state <= SYNC;
                            bit_count <= 0;
                        end else begin
                            state <= IDLE;
                        end
                    end else begin
                        bit_count <= bit_count + 1;
                    end
                end
                SYNC: begin
                    if (bit_count == 8) begin
                        if (shift_reg == 8'h55) begin
                            state <= DATA;
                            bit_count <= 0;
                        end else begin
                            state <= IDLE;
                        end
                    end else begin
                        shift_reg <= {rx, shift_reg[7:1]};
                        bit_count <= bit_count + 1;
                    end
                end
                DATA: begin
                    if (bit_count == 8) begin
                        state <= CHECKSUM;
                        bit_count <= 0;
                        data <= shift_reg;
                        checksum <= shift_reg;
                    end else begin
                        shift_reg <= {rx, shift_reg[7:1]};
                        bit_count <= bit_count + 1;
                    end
                end
                CHECKSUM: begin
                    if (bit_count == 8) begin
                        if (shift_reg == ~checksum) begin
                            // Checksum is valid, data is ready
                        end else begin
                            // Checksum error
                            data <= 8'h00;
                        end
                        state <= IDLE;
                    end else begin
                        shift_reg <= {rx, shift_reg[7:1]};
                        bit_count <= bit_count + 1;
                    end
                end
            endcase
        end
    end
endmodule