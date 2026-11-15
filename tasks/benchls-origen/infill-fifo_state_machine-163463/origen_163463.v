module origen_163463(
    input wr_en,
    input rd_en,
    input [2:0] state,
    input [3:0] data_count,
    output reg [2:0] next_state
);

reg write_state, read_state, full_state, empty_state, noop_state;

[MASKED]

always @(*) begin
    case (state)
        3'b000: // INIT
            next_state = 3'b001; // NO_OP
        3'b001: // NO_OP
            if (write_state)
                next_state = 3'b010; // WRITE
            else if (read_state)
                next_state = 3'b011; // READ
            else if (full_state)
                next_state = 3'b100; // WR_ERROR
            else if (empty_state)
                next_state = 3'b101; // RD_ERROR
            else
                next_state = 3'b001; // NO_OP
        3'b010: // WRITE
            next_state = 3'b001; // NO_OP
        3'b011: // READ
            next_state = 3'b001; // NO_OP
        3'b100: // WR_ERROR
            if (noop_state)
                next_state = 3'b001; // NO_OP
            else
                next_state = 3'b100; // WR_ERROR
        3'b101: // RD_ERROR
            if (noop_state)
                next_state = 3'b001; // NO_OP
            else
                next_state = 3'b101; // RD_ERROR
        default:
            next_state = 3'b001; // NO_OP
    endcase
end

endmodule