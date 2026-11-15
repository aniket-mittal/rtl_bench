module origen_137914 (
    input CCLK,
    input debpbo,
    input [2047:0] strdata,
    input reset_in,
    input clear_in,
    input home_in,
    input write_in,
    input [7:0] address_in,
    output reg resetlcd,
    output reg clearlcd,
    output reg homelcd,
    output reg datalcd,
    output reg [7:0] addrlcd,
    output reg initlcd,
    output reg [7:0] lcddatin
);

    // State machine parameters
    localparam IDLE = 4'b0000;
    localparam INIT = 4'b0001;
    localparam RESET = 4'b0010;
    localparam CLEAR = 4'b0011;
    localparam HOME = 4'b0100;
    localparam WRITE_PREP = 4'b0101;
    localparam WRITE_DATA = 4'b0110;
    localparam WRITE_DONE = 4'b0111;
    localparam ADDR_SET = 4'b1000;

    reg [3:0] state, next_state;
    reg [7:0] char_count;
    reg [7:0] current_address;

    always @(posedge CCLK or posedge reset_in) begin
        if (reset_in) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (debpbo) next_state = INIT;
                else if (reset_in) next_state = RESET;
                else if (clear_in) next_state = CLEAR;
                else if (home_in) next_state = HOME;
                else if (write_in) next_state = WRITE_PREP;
            end
            INIT: next_state = IDLE;
            RESET: next_state = IDLE;
            CLEAR: next_state = IDLE;
            HOME: next_state = IDLE;
            WRITE_PREP: next_state = WRITE_DATA;
            WRITE_DATA: begin
                if (char_count == 8'd255) next_state = WRITE_DONE;
                else next_state = WRITE_DATA;
            end
            WRITE_DONE: next_state = IDLE;
            ADDR_SET: next_state = WRITE_PREP;
        endcase
    end

    always @(posedge CCLK) begin
        case (state)
            IDLE: begin
                resetlcd <= 0;
                clearlcd <= 0;
                homelcd <= 0;
                datalcd <= 0;
                initlcd <= 0;
                char_count <= 0;
                current_address <= 0;
            end
            INIT: begin
                initlcd <= 1;
            end
            RESET: begin
                resetlcd <= 1;
            end
            CLEAR: begin
                clearlcd <= 1;
            end
            HOME: begin
                homelcd <= 1;
            end
            WRITE_PREP: begin
                datalcd <= 1;
                current_address <= address_in;
            end
            WRITE_DATA: begin
                lcddatin <= strdata[char_count*8 +: 8];
                addrlcd <= current_address;
                char_count <= char_count + 1;
                current_address <= current_address + 1;
            end
            WRITE_DONE: begin
                datalcd <= 0;
            end
            ADDR_SET: begin
                current_address <= address_in;
            end
        endcase
    end

endmodule