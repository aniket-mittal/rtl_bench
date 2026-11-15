module origen_046449 (
    input wire rstb,
    input wire clk,
    input wire mlb,
    input wire start,
    input wire [7:0] tdat,
    input wire [1:0] cdiv,
    input wire din,
    output reg ss,
    output reg sck,
    output reg dout,
    output reg done,
    output reg [7:0] rdata
);

    // FSM states
    localparam IDLE = 2'b00;
    localparam SEND = 2'b01;
    localparam FINISH = 2'b10;

    reg [1:0] state, next_state;
    reg [2:0] bit_count;
    reg [7:0] shift_reg_tx, shift_reg_rx;
    reg [3:0] clk_div_counter;
    reg sck_internal;

    // FSM state transitions and control signal generation
    always @(posedge clk or negedge rstb) begin
        if (!rstb) begin
            state <= IDLE;
            ss <= 1'b1;
            done <= 1'b0;
            bit_count <= 3'b000;
        end else begin
            state <= next_state;
            case (state)
                IDLE: begin
                    ss <= 1'b1;
                    done <= 1'b0;
                    if (start) begin
                        ss <= 1'b0;
                        shift_reg_tx <= tdat;
                        bit_count <= 3'b000;
                    end
                end
                SEND: begin
                    ss <= 1'b0;
                    if (bit_count == 3'b111) begin
                        next_state <= FINISH;
                    end else begin
                        bit_count <= bit_count + 1'b1;
                    end
                end
                FINISH: begin
                    ss <= 1'b1;
                    done <= 1'b1;
                    next_state <= IDLE;
                end
            endcase
        end
    end

    // Clock generation and division
    always @(posedge clk or negedge rstb) begin
        if (!rstb) begin
            clk_div_counter <= 4'b0000;
            sck_internal <= 1'b0;
        end else if (state == SEND) begin
            clk_div_counter <= clk_div_counter + 1'b1;
            case (cdiv)
                2'b00: sck_internal <= clk_div_counter[0];
                2'b01: sck_internal <= clk_div_counter[1];
                2'b10: sck_internal <= clk_div_counter[2];
                2'b11: sck_internal <= clk_div_counter[3];
            endcase
        end else begin
            clk_div_counter <= 4'b0000;
            sck_internal <= 1'b0;
        end
    end

    // Data reception and deserialization
    always @(posedge sck_internal or negedge rstb) begin
        if (!rstb) begin
            shift_reg_rx <= 8'b0;
        end else if (state == SEND) begin
            if (mlb) begin
                shift_reg_rx <= {shift_reg_rx[6:0], din};
            end else begin
                shift_reg_rx <= {din, shift_reg_rx[7:1]};
            end
        end
    end

    // Data transmission and serialization
    always @(negedge sck_internal or negedge rstb) begin
        if (!rstb) begin
            dout <= 1'b0;
        end else if (state == SEND) begin
            if (mlb) begin
                dout <= shift_reg_tx[0];
                shift_reg_tx <= {1'b0, shift_reg_tx[7:1]};
            end else begin
                dout <= shift_reg_tx[7];
                shift_reg_tx <= {shift_reg_tx[6:0], 1'b0};
            end
        end
    end

    // Output assignments
    always @(*) begin
        sck = (state == SEND) ? sck_internal : 1'b0;
        rdata = (state == FINISH) ? shift_reg_rx : 8'b0;
    end

endmodule