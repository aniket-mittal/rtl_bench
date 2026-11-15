module origen_148031(
    input wire clk,
    input wire reset,
    input wire pause,
    input wire a,
    input wire b,
    output reg [3:0] out
);

    // XOR gate implementation
    wire xor_out;
    reg xor_behavioral;
    wire xor_structural;

    always @(*) begin
        xor_behavioral = a ^ b;
    end

    assign xor_structural = (a & ~b) | (~a & b);

    // MUX for XOR implementation selection
    assign xor_out = (a ^ b) ? xor_behavioral : xor_structural;

    // Decade counter using Johnson counter
    reg [4:0] johnson_counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            johnson_counter <= 5'b00000;
        end else if (!pause) begin
            johnson_counter <= {~johnson_counter[0], johnson_counter[4:1]};
        end
    end

    // Decode Johnson counter to decimal
    always @(*) begin
        case (johnson_counter)
            5'b00000: out = 4'd0;
            5'b00001: out = 4'd1;
            5'b00011: out = 4'd2;
            5'b00111: out = 4'd3;
            5'b01111: out = 4'd4;
            5'b11111: out = 4'd5;
            5'b11110: out = 4'd6;
            5'b11100: out = 4'd7;
            5'b11000: out = 4'd8;
            5'b10000: out = 4'd9;
            default: out = 4'd0;
        endcase
    end

    // Output selection
    always @(posedge clk) begin
        if (pause) begin
            out <= {3'b000, xor_out};
        end
    end

endmodule