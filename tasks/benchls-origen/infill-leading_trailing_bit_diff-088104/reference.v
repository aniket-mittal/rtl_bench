module origen_088104 (
    input [7:0] encode_In,
    input [2:0] level,
    output reg [2:0] Binary_Out,
    output reg error
);

    reg [2:0] right, left;
    reg [3:0] diff;

    always @(*) begin
        // Find rightmost '1'
        casez (encode_In)
            8'b???????1: right = 3'd0;
            8'b??????10: right = 3'd1;
            8'b?????100: right = 3'd2;
            8'b????1000: right = 3'd3;
            8'b???10000: right = 3'd4;
            8'b??100000: right = 3'd5;
            8'b?1000000: right = 3'd6;
            8'b10000000: right = 3'd7;
            default: right = 3'd0;
        endcase

        // Find leftmost '1'
        casez (encode_In)
            8'b1???????: left = 3'd7;
            8'b01??????: left = 3'd6;
            8'b001?????: left = 3'd5;
            8'b0001????: left = 3'd4;
            8'b00001???: left = 3'd3;
            8'b000001??: left = 3'd2;
            8'b0000001?: left = 3'd1;
            8'b00000001: left = 3'd0;
            default: left = 3'd0;
        endcase

        // Calculate difference
        diff = left - right;

        // Error detection
        error = (diff >= level);

        // Output encoding
        if (error) begin
            Binary_Out = 3'b000;
        end else begin
            case (diff)
                4'd0: Binary_Out = left;
                4'd1: Binary_Out = left;
                default: Binary_Out = left + 1'b1;
            endcase
        end
    end

endmodule