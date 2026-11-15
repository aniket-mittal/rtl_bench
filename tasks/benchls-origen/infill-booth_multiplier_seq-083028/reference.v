module origen_083028 (
    input wire clk,
    input wire reset,
    input wire Multu,
    input wire [31:0] dataA,
    input wire [31:0] dataB,
    output reg [63:0] dataOut
);

    reg state;
    reg [7:0] counter;
    reg [63:0] temp;
    reg [63:0] mcnd;
    reg [31:0] mpy;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= 1'b0;
            counter <= 8'd0;
            temp <= 64'd0;
            mcnd <= 64'd0;
            mpy <= 32'd0;
            dataOut <= 64'd0;
        end
        else begin
            case (state)
                1'b0: begin // Idle state
                    if (Multu) begin
                        state <= 1'b1;
                        counter <= 8'd0;
                        temp <= 64'd0;
                        mcnd <= {32'd0, dataA};
                        mpy <= dataB;
                    end
                end
                1'b1: begin // Multiply state
                    if (counter < 8'd32) begin
                        if (mpy[0])
                            temp <= temp + mcnd;
                        mcnd <= mcnd << 1;
                        mpy <= mpy >> 1;
                        counter <= counter + 8'd1;
                    end
                    else begin
                        dataOut <= temp;
                        state <= 1'b0;
                    end
                end
            endcase
        end
    end

endmodule