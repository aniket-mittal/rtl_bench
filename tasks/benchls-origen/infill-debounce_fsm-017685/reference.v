module origen_017685 (
    input wire clk,
    input wire rst_n,
    input wire b_in,
    input wire cnt,
    output reg strt,
    output reg db_out
);

    // State encoding
    localparam [2:0] IDLE  = 3'b000,
                     LOW1  = 3'b001,
                     LOW2  = 3'b010,
                     LOW3  = 3'b011,
                     HIGH1 = 3'b100,
                     HIGH2 = 3'b101;

    reg [2:0] state, next_state;

    // State register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE:  next_state = b_in ? IDLE : LOW1;
            LOW1:  next_state = LOW2;
            LOW2:  next_state = cnt ? (b_in ? IDLE : LOW3) : LOW2;
            LOW3:  next_state = b_in ? HIGH1 : LOW3;
            HIGH1: next_state = HIGH2;
            HIGH2: next_state = cnt ? (b_in ? IDLE : LOW3) : HIGH2;
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(*) begin
        case (state)
            IDLE:  begin db_out = 1'b1; strt = 1'b0; end
            LOW1:  begin db_out = 1'b1; strt = 1'b1; end
            LOW2:  begin db_out = 1'b1; strt = 1'b0; end
            LOW3:  begin db_out = 1'b0; strt = 1'b0; end
            HIGH1: begin db_out = 1'b0; strt = 1'b1; end
            HIGH2: begin db_out = 1'b0; strt = 1'b0; end
            default: begin db_out = 1'b1; strt = 1'b0; end
        endcase
    end

endmodule