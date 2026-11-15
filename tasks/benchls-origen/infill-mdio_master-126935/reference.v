module origen_126935 (
    input wire reset,
    input wire clock,
    input wire mdc,
    input wire mdi,
    input wire mode,
    input wire begin_transaction,
    input wire [4:0] phy_address,
    input wire [4:0] reg_address,
    input wire [15:0] data_in,
    output reg mdo,
    output reg [15:0] data_out
);

    // State machine states
    localparam IDLE = 3'b000;
    localparam START = 3'b001;
    localparam PREAMBLE = 3'b010;
    localparam ST = 3'b011;
    localparam OP = 3'b100;
    localparam PHYAD = 3'b101;
    localparam REGAD = 3'b110;
    localparam TA = 3'b111;

    reg [2:0] state;
    reg [5:0] bit_counter;
    reg [31:0] shift_reg;
    reg [15:0] read_data;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            bit_counter <= 0;
            shift_reg <= 0;
            mdo <= 1'bz;
            data_out <= 16'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (begin_transaction) begin
                        state <= START;
                        bit_counter <= 0;
                        shift_reg <= {32{1'b1}}; // Preamble
                    end
                end

                START: begin
                    state <= PREAMBLE;
                    mdo <= 1'b0;
                end

                PREAMBLE: begin
                    if (bit_counter == 31) begin
                        state <= ST;
                        bit_counter <= 0;
                    end else begin
                        mdo <= shift_reg[31];
                        shift_reg <= {shift_reg[30:0], 1'b1};
                        bit_counter <= bit_counter + 1;
                    end
                end

                ST: begin
                    if (bit_counter == 1) begin
                        state <= OP;
                        bit_counter <= 0;
                        shift_reg <= {mode, 1'b0, phy_address, reg_address, 16'b0};
                    end else begin
                        mdo <= 1'b1;
                        bit_counter <= bit_counter + 1;
                    end
                end

                OP: begin
                    if (bit_counter == 1) begin
                        state <= PHYAD;
                        bit_counter <= 0;
                    end else begin
                        mdo <= shift_reg[31];
                        shift_reg <= {shift_reg[30:0], 1'b0};
                        bit_counter <= bit_counter + 1;
                    end
                end

                PHYAD: begin
                    if (bit_counter == 4) begin
                        state <= REGAD;
                        bit_counter <= 0;
                    end else begin
                        mdo <= shift_reg[31];
                        shift_reg <= {shift_reg[30:0], 1'b0};
                        bit_counter <= bit_counter + 1;
                    end
                end

                REGAD: begin
                    if (bit_counter == 4) begin
                        state <= TA;
                        bit_counter <= 0;
                    end else begin
                        mdo <= shift_reg[31];
                        shift_reg <= {shift_reg[30:0], 1'b0};
                        bit_counter <= bit_counter + 1;
                    end
                end

                TA: begin
                    if (bit_counter == 1) begin
                        if (mode == 1'b0) begin // Read operation
                            mdo <= 1'bz;
                        end else begin // Write operation
                            mdo <= 1'b1;
                        end
                        bit_counter <= bit_counter + 1;
                    end else if (bit_counter == 17) begin
                        state <= IDLE;
                        if (mode == 1'b0) begin // Read operation
                            data_out <= read_data;
                        end
                    end else begin
                        if (mode == 1'b0) begin // Read operation
                            read_data <= {read_data[14:0], mdi};
                        end else begin // Write operation
                            mdo <= data_in[15 - (bit_counter - 2)];
                        end
                        bit_counter <= bit_counter + 1;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule