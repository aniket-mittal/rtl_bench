module origen_125220 #(
    parameter N = 8,  // Number of data signals
    parameter M = 11  // Number of output signals
)(
    input wire [N-1:0] data,
    input wire clk,
    input wire rst,
    output reg [M-1:0] out
);

    // LCD commands
    localparam CLEAR_DISPLAY = 4'b0001;
    localparam RETURN_HOME   = 4'b0010;
    localparam ENTRY_MODE    = 4'b0110;
    localparam DISPLAY_ON    = 4'b1100;
    localparam FUNCTION_SET  = 4'b0010;

    // State machine states
    localparam IDLE          = 3'd0;
    localparam INITIALIZE    = 3'd1;
    localparam WRITE_COMMAND = 3'd2;
    localparam WRITE_DATA    = 3'd3;

    reg [2:0] state, next_state;
    reg [3:0] lcd_data;
    reg [3:0] lcd_command;
    reg [7:0] ascii_char;
    reg [3:0] init_step;
    reg rs, rw, en;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= INITIALIZE;
            init_step <= 4'd0;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            IDLE: begin
                next_state = (data != 0) ? WRITE_DATA : IDLE;
            end
            INITIALIZE: begin
                if (init_step == 4'd4)
                    next_state = IDLE;
                else
                    next_state = INITIALIZE;
            end
            WRITE_COMMAND: begin
                next_state = IDLE;
            end
            WRITE_DATA: begin
                next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end

    always @(posedge clk) begin
        case (state)
            IDLE: begin
                en <= 1'b0;
            end
            INITIALIZE: begin
                case (init_step)
                    4'd0: begin
                        lcd_command <= FUNCTION_SET;
                        rs <= 1'b0;
                        rw <= 1'b0;
                        en <= 1'b1;
                        init_step <= init_step + 1;
                    end
                    4'd1: begin
                        lcd_command <= DISPLAY_ON;
                        rs <= 1'b0;
                        rw <= 1'b0;
                        en <= 1'b1;
                        init_step <= init_step + 1;
                    end
                    4'd2: begin
                        lcd_command <= CLEAR_DISPLAY;
                        rs <= 1'b0;
                        rw <= 1'b0;
                        en <= 1'b1;
                        init_step <= init_step + 1;
                    end
                    4'd3: begin
                        lcd_command <= ENTRY_MODE;
                        rs <= 1'b0;
                        rw <= 1'b0;
                        en <= 1'b1;
                        init_step <= init_step + 1;
                    end
                    default: begin
                        en <= 1'b0;
                    end
                endcase
            end
            WRITE_COMMAND: begin
                rs <= 1'b0;
                rw <= 1'b0;
                en <= 1'b1;
            end
            WRITE_DATA: begin
                ascii_char <= data;
                lcd_data <= ascii_char[7:4];
                rs <= 1'b1;
                rw <= 1'b0;
                en <= 1'b1;
            end
        endcase
    end

    always @(*) begin
        out = {rs, rw, en, (state == WRITE_DATA) ? lcd_data : lcd_command, 4'b0000};
    end

endmodule