module origen_205261(
    input RSTn,
    input BPS_CLK,
    input RX_Pin_In,
    output reg RX_En_Sig = 1'b1,
    output reg RX_Done_Sig,
    output reg [7:0] RX_Data
);

    reg [3:0] i = 4'd0;
    reg [7:0] rData = 8'b0;
    reg isDone = 1'b0;

    always @(posedge BPS_CLK or negedge RSTn) begin
        if (~RSTn) begin
            i <= 4'd0;
            rData <= 8'b0;
            isDone <= 1'b0;
        end
        else begin
            if (RX_En_Sig) begin
                case (i)
                    4'd0: begin
                        if (~RX_Pin_In) begin
                            i <= i + 1;
                        end
                    end
                    4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8: begin
                        rData[i-1] <= RX_Pin_In;
                        i <= i + 1;
                    end
                    4'd9: begin
                        if (RX_Pin_In) begin
                            isDone <= 1'b1;
                            i <= i + 1;
                        end
                        else begin
                            i <= 4'd0;
                        end
                    end
                    4'd10: begin
                        isDone <= 1'b0;
                        i <= 4'd0;
                    end
                endcase
            end
        end
    end

    assign RX_Data = rData;
    assign RX_Done_Sig = isDone;

endmodule