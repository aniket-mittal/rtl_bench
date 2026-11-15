module origen_207259(
    input clk,
    input rst_n,
    input wrempty,
    input wrfull,
    output reg [7:0] data,
    output reg wrreq
);

reg [1:0] flow_cnt;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        wrreq <= 1'b0;
        data <= 8'b0;
        flow_cnt <= 2'b00;
    end
    else begin
        case (flow_cnt)
            2'b00: begin
                if (wrempty) begin
                    wrreq <= 1'b1;
                    flow_cnt <= 2'b01;
                end
                else begin
                    wrreq <= 1'b0;
                    flow_cnt <= 2'b00;
                end
            end
            2'b01: begin
                if (wrfull) begin
                    wrreq <= 1'b0;
                    data <= 8'b0;
                    flow_cnt <= 2'b00;
                end
                else begin
                    wrreq <= 1'b1;
                    data <= data + 1;
                    flow_cnt <= 2'b01;
                end
            end
            default: begin
                wrreq <= 1'b0;
                data <= 8'b0;
                flow_cnt <= 2'b00;
            end
        endcase
    end
end

endmodule