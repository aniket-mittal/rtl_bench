module origen_062479 (
    input [2:0] state,
    input data_in_valid,
    input pop_fifo,
    output reg [2:0] next_state,
    output reg fifo_empty,
    output reg fifo_full,
    output reg err
);

always @(*) begin
    fifo_empty = 1'b0;
    fifo_full = 1'b0;
    err = 1'b0;
    
    casex ({state, data_in_valid, pop_fifo})
        // Empty state
        5'b000_00: next_state = 3'b000;
        5'b000_10: next_state = 3'b001;
        5'b000_01: next_state = 3'b000;
        5'b000_11: next_state = 3'b001;
        
        // One element
        5'b001_00: next_state = 3'b001;
        5'b001_10: next_state = 3'b010;
        5'b001_01: next_state = 3'b000;
        5'b001_11: next_state = 3'b001;
        
        // Two elements
        5'b010_00: next_state = 3'b010;
        5'b010_10: next_state = 3'b011;
        5'b010_01: next_state = 3'b001;
        5'b010_11: next_state = 3'b010;
        
        // Three elements
        5'b011_00: next_state = 3'b011;
        5'b011_10: next_state = 3'b100;
        5'b011_01: next_state = 3'b010;
        5'b011_11: next_state = 3'b011;
        
        // Full state
        5'b100_00: next_state = 3'b100;
        5'b100_10: next_state = 3'b100;
        5'b100_01: next_state = 3'b011;
        5'b100_11: next_state = 3'b100;
        
        // Error cases
        default: begin
            next_state = 3'b111;
            err = 1'b1;
        end
    endcase
    
    // Set fifo_empty and fifo_full flags
    fifo_empty = (state == 3'b000);
    fifo_full = (state == 3'b100);
end

endmodule