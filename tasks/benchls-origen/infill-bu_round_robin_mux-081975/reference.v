module origen_081975 (
    input wire clock,
    input wire areset,
    input wire diag_done,
    input wire [31:0] bu1,
    input wire [31:0] bu2,
    input wire [31:0] bu3,
    input wire [31:0] bu4,
    output reg [31:0] ndiag_out
);

    // State encoding
    localparam [1:0] sBU1 = 2'b00,
                     sBU2 = 2'b01,
                     sBU3 = 2'b10,
                     sBU4 = 2'b11;

    reg [1:0] current_state, next_state;

    // Sequential logic for state updates
    always @(posedge clock or posedge areset) begin
        if (areset)
            current_state <= sBU1;
        else
            current_state <= next_state;
    end

    // Combinational logic for next state and output
    always @(*) begin
        case (current_state)
            sBU1: begin
                ndiag_out = bu1;
                next_state = diag_done ? sBU2 : sBU1;
            end
            sBU2: begin
                ndiag_out = bu2;
                next_state = diag_done ? sBU3 : sBU2;
            end
            sBU3: begin
                ndiag_out = bu3;
                next_state = diag_done ? sBU4 : sBU3;
            end
            sBU4: begin
                ndiag_out = bu4;
                next_state = diag_done ? sBU1 : sBU4;
            end
            default: begin
                ndiag_out = 32'b0;
                next_state = sBU1;
            end
        endcase
    end

endmodule