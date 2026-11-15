module origen_027562 #(
    parameter WIDTH = 16
)(
    input [3:0] op,
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input [3:0] cc_in,
    output reg [WIDTH-1:0] result,
    output reg [3:0] cc_out
);

    // Internal signals
    reg carry, overflow;
    reg [WIDTH:0] temp;
    reg [WIDTH-1:0] shift_result;

    // Condition code update types
    localparam NONE = 2'b00, NZCV = 2'b01, NZ = 2'b10;

    always @(*) begin
        // Default values
        result = {WIDTH{1'bx}};
        carry = 1'b0;
        overflow = 1'b0;
        cc_out = cc_in;

        case(op)
            4'b0000: begin // ADD
                {carry, result} = a + b;
                overflow = (a[WIDTH-1] == b[WIDTH-1]) && (result[WIDTH-1] != a[WIDTH-1]);
                cc_out = {result[WIDTH-1], result == 0, carry, overflow};
            end
            4'b0001: begin // ADC
                {carry, result} = a + b + cc_in[1];
                overflow = (a[WIDTH-1] == b[WIDTH-1]) && (result[WIDTH-1] != a[WIDTH-1]);
                cc_out = {result[WIDTH-1], result == 0, carry, overflow};
            end
            4'b0010: begin // SUB
                {carry, result} = a - b;
                overflow = (a[WIDTH-1] != b[WIDTH-1]) && (result[WIDTH-1] == b[WIDTH-1]);
                cc_out = {result[WIDTH-1], result == 0, ~carry, overflow};
            end
            4'b0011: begin // SBC
                {carry, result} = a - b - ~cc_in[1];
                overflow = (a[WIDTH-1] != b[WIDTH-1]) && (result[WIDTH-1] == b[WIDTH-1]);
                cc_out = {result[WIDTH-1], result == 0, ~carry, overflow};
            end
            4'b0100: begin // AND
                result = a & b;
                cc_out = {result[WIDTH-1], result == 0, cc_in[1:0]};
            end
            4'b0101: begin // OR
                result = a | b;
                cc_out = {result[WIDTH-1], result == 0, cc_in[1:0]};
            end
            4'b0110: begin // XOR
                result = a ^ b;
                cc_out = {result[WIDTH-1], result == 0, cc_in[1:0]};
            end
            4'b0111: begin // LSL
                shift_result = a << b[4:0];
                result = shift_result;
                carry = (b[4:0] > 0) ? a[WIDTH-1-b[4:0]+1] : 1'b0;
                cc_out = {result[WIDTH-1], result == 0, carry, cc_in[0]};
            end
            4'b1000: begin // LSR
                shift_result = a >> b[4:0];
                result = shift_result;
                carry = (b[4:0] > 0) ? a[b[4:0]-1] : 1'b0;
                cc_out = {result[WIDTH-1], result == 0, carry, cc_in[0]};
            end
            4'b1001: begin // ASR
                shift_result = $signed(a) >>> b[4:0];
                result = shift_result;
                carry = (b[4:0] > 0) ? a[b[4:0]-1] : 1'b0;
                cc_out = {result[WIDTH-1], result == 0, carry, cc_in[0]};
            end
            4'b1010: begin // ROR
                shift_result = (a >> b[4:0]) | (a << (WIDTH - b[4:0]));
                result = shift_result;
                carry = (b[4:0] > 0) ? a[b[4:0]-1] : cc_in[1];
                cc_out = {result[WIDTH-1], result == 0, carry, cc_in[0]};
            end
            4'b1011: begin // ADD (additional)
                {carry, result} = a + b;
                overflow = (a[WIDTH-1] == b[WIDTH-1]) && (result[WIDTH-1] != a[WIDTH-1]);
                cc_out = {result[WIDTH-1], result == 0, carry, overflow};
            end
            4'b1100: begin // ADD (additional)
                {carry, result} = a + b;
                overflow = (a[WIDTH-1] == b[WIDTH-1]) && (result[WIDTH-1] != a[WIDTH-1]);
                cc_out = {result[WIDTH-1], result == 0, carry, overflow};
            end
            default: result = {WIDTH{1'bx}};
        endcase
    end

endmodule