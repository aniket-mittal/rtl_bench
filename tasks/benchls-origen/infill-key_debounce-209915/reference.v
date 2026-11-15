module origen_209915(
    input clk,
    input rst_n,
    input key_in,
    output reg key_out
);

parameter MASK_TIME = 200000;

reg s0, s1;
reg temp;
reg [31:0] count;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        s0 <= 1'b1;
        s1 <= 1'b0;
        temp <= 1'b1;
        count <= 32'b0;
        key_out <= 1'b1;
    end
    else begin
        case({s0, s1})
            2'b10: begin
                if(key_in != temp) begin
                    s0 <= 1'b0;
                    s1 <= 1'b1;
                    temp <= key_in;
                    count <= 32'b0;
                end
            end
            2'b01: begin
                if(key_in == temp) begin
                    if(count < MASK_TIME) begin
                        count <= count + 32'b1;
                    end
                    else begin
                        s0 <= 1'b1;
                        s1 <= 1'b0;
                        key_out <= temp;
                    end
                end
                else begin
                    temp <= key_in;
                    count <= 32'b0;
                end
            end
        endcase
    end
end

endmodule