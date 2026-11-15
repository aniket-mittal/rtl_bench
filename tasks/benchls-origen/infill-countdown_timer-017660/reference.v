module origen_017660 (
    input wire i_clk,
    input wire i_rst,
    input wire [31:0] i_count,
    input wire i_en,
    output wire o_done
);

    // State encoding
    localparam IDLE = 1'b0;
    localparam COUNTING = 1'b1;

    // Internal registers
    reg [31:0] r_counter;
    reg r_state, r_next_state;
    reg [31:0] r_next_counter;

    // Output assignment
    assign o_done = (r_state == IDLE);

    // Combinational logic for next state and counter value
    always @(*) begin
        r_next_state = r_state;
        r_next_counter = r_counter;

        case (r_state)
            IDLE: begin
                if (i_en) begin
                    r_next_state = COUNTING;
                    r_next_counter = i_count;
                end else begin
                    r_next_counter = 32'd0;
                end
            end
            COUNTING: begin
                if (!i_en || r_counter == 32'd0) begin
                    r_next_state = IDLE;
                    r_next_counter = 32'd0;
                end else begin
                    r_next_counter = r_counter - 1'b1;
                end
            end
        endcase
    end

    // Sequential logic for state and counter update
    always @(posedge i_clk or negedge i_rst) begin
        if (!i_rst) begin
            r_state <= IDLE;
            r_counter <= 32'd0;
        end else begin
            r_state <= r_next_state;
            r_counter <= r_next_counter;
        end
    end

endmodule