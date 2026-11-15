module origen_061090 #(
    parameter message_number = 0,
    parameter [31:0] konstant = 32'h0
) (
    input wire clk,
    input wire [31:0] d_in,
    input wire [5:0] offset_in,
    input wire [7:0] msbyte_in,
    output reg [5:0] offset_out,
    output reg [7:0] msbyte_out,
    output reg [31:0] p_out
);

    reg [31:0] message;
    reg [31:0] p;
    wire [3:0] word_selector;
    wire [1:0] byte_selector;
    reg [31:0] message_next;
    wire [31:0] xor_result;
    wire [31:0] carry;

    assign word_selector = offset_in[5:2];
    assign byte_selector = offset_in[1:0];

    always @(*) begin
        if (word_selector == message_number[3:0]) begin
            case (byte_selector)
                2'b00: message_next = {message[31:8], msbyte_in};
                2'b01: message_next = {message[31:16], msbyte_in, message[7:0]};
                2'b10: message_next = {message[31:24], msbyte_in, message[15:0]};
                2'b11: message_next = {msbyte_in, message[23:0]};
            endcase
        end else begin
            message_next = message;
        end

        case (message_number)
            15: message_next = 32'h0;
            14: message_next = {message_next[23:0], 8'h80};
            13: message_next = {message_next[23:0], 8'h0};
            default: message_next = message_next;
        endcase
    end

    assign xor_result = konstant ^ d_in ^ message_next;
    assign carry = (konstant & d_in) | (konstant & message_next) | (d_in & message_next);

    always @(posedge clk) begin
        message <= message_next;
        p <= xor_result + {carry[30:0], 1'b0};
        offset_out <= offset_in;
        msbyte_out <= msbyte_in;
        p_out <= p;
    end

endmodule