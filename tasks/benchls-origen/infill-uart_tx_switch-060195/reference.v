module origen_060195(
    input wire clk,
    input wire reset,
    input wire transmitir,
    input wire bandera,
    input wire [7:0] entradaSw,
    output reg salidaTx
);

    reg [5:0] state;
    reg [7:0] data;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= 6'd0;
            salidaTx <= 1'b1;
            data <= 8'd0;
        end else begin
            case (state)
                6'd0: begin
                    salidaTx <= 1'b1;
                    if (transmitir || bandera) begin
                        state <= 6'd1;
                        data <= entradaSw;
                    end
                end
                6'd1: begin
                    salidaTx <= 1'b0;  // Start bit
                    state <= 6'd2;
                end
                6'd2, 6'd3, 6'd4, 6'd5, 6'd6, 6'd7, 6'd8, 6'd9: begin
                    salidaTx <= data[state - 6'd2];
                    state <= state + 6'd1;
                end
                6'd10: begin
                    salidaTx <= 1'b0;  // Stop bit (logic 0)
                    state <= 6'd11;
                end
                6'd11: begin
                    salidaTx <= 1'b1;  // Stop bit (logic 1)
                    state <= 6'd12;
                end
                6'd90: begin
                    state <= 6'd0;
                end
                default: begin
                    state <= state + 6'd1;
                end
            endcase
        end
    end

endmodule