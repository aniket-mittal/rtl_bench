module origen_140433 (
    input wire clk,
    input wire rst,
    input wire [7:0] in1,
    input wire [7:0] in2,
    output reg [2:0] out
);

    reg [7:0] stage1_in;
    reg [3:0] stage2_enc;
    reg [2:0] stage3_out;

    // Stage 1: Input selection and registration
    always @(posedge clk or posedge rst) begin
        if (rst)
            stage1_in <= 8'b0;
        else
            stage1_in <= in1 | in2;
    end

    // Stage 2: Encoding
    always @(posedge clk or posedge rst) begin
        if (rst)
            stage2_enc <= 4'b0;
        else begin
            casez (stage1_in)
                8'b1???????: stage2_enc <= 4'd7;
                8'b01??????: stage2_enc <= 4'd6;
                8'b001?????: stage2_enc <= 4'd5;
                8'b0001????: stage2_enc <= 4'd4;
                8'b00001???: stage2_enc <= 4'd3;
                8'b000001??: stage2_enc <= 4'd2;
                8'b0000001?: stage2_enc <= 4'd1;
                8'b00000001: stage2_enc <= 4'd0;
                default:     stage2_enc <= 4'd0;
            endcase
        end
    end

    // Stage 3: Output registration
    always @(posedge clk or posedge rst) begin
        if (rst)
            stage3_out <= 3'b0;
        else
            stage3_out <= stage2_enc[2:0];
    end

    // Final output
    always @(posedge clk or posedge rst) begin
        if (rst)
            out <= 3'b0;
        else
            out <= stage3_out;
    end

endmodule