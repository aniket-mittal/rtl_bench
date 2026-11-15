module origen_134076 (
    input wire clk,
    input wire reset,
    input wire softreset,
    input wire cyc,
    input wire we,
    output reg [7:0] read_out,
    output reg [7:0] write_out,
    output reg [7:0] err_out
);

    // State encoding
    localparam [2:0] STATE_Initial = 3'b000,
                     STATE_1       = 3'b001,
                     STATE_2       = 3'b010;

    reg [2:0] current_state, next_state;
    reg error_flag;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= STATE_Initial;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        next_state = current_state;
        case (current_state)
            STATE_Initial: begin
                if (cyc)
                    next_state = we ? STATE_1 : STATE_2;
            end
            STATE_1: begin
                if (error_flag || !cyc)
                    next_state = STATE_Initial;
            end
            STATE_2: begin
                if (error_flag || !cyc)
                    next_state = STATE_Initial;
            end
            default: next_state = STATE_Initial;
        endcase
    end

    // Output logic and counter management
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            read_out <= 8'b0;
            write_out <= 8'b0;
            err_out <= 8'b0;
            error_flag <= 1'b0;
        end else if (softreset) begin
            read_out <= 8'b0;
            write_out <= 8'b0;
            err_out <= 8'b0;
        end else begin
            case (current_state)
                STATE_Initial: begin
                    error_flag <= 1'b0;
                end
                STATE_1: begin
                    if (!cyc && !error_flag) begin
                        write_out <= write_out + 1;
                    end else if (error_flag) begin
                        err_out <= err_out + 1;
                    end
                end
                STATE_2: begin
                    if (!cyc && !error_flag) begin
                        read_out <= read_out + 1;
                    end else if (error_flag) begin
                        err_out <= err_out + 1;
                    end
                end
            endcase
        end
    end

    // Error detection (example: error occurs when both cyc and we are high for 2 consecutive clock cycles)
    reg cyc_prev, we_prev;
    always @(posedge clk) begin
        cyc_prev <= cyc;
        we_prev <= we;
        if (cyc && we && cyc_prev && we_prev)
            error_flag <= 1'b1;
        else
            error_flag <= 1'b0;
    end

endmodule