module rtlpp_02575
(
    input wire          clk,                
    input wire          reset,              
    input wire          up,                 
    input wire          en,                 
    input wire          load,               
    input wire [3:0]    value,              
    output reg [3:0]    bcd,                
    output wire         co,                 
    output wire         fs                  
);

wire                    bcd_max, bcd_min;

always @ (posedge clk) begin
    if (reset) begin
        bcd <= value;
    end
    else begin
        if (load) begin
            bcd <= value;
        end else begin
            if (en) begin
                if (up) begin
                    if (bcd_max) begin
                        bcd <= 4'd0;
                    end else begin
                        bcd <= bcd + 1'b1;
                    end
                end else begin
                    if (bcd_min) begin
                        bcd <= 4'd9;
                    end else begin
                        bcd <= bcd - 1'b1;
                    end
                end
            end
        end
    end
end

assign bcd_min = (bcd == 4'd0) ? 1'b1 : 1'b0;
assign bcd_max = (bcd == 4'd9) ? 1'b1 : 1'b0;
assign fs = (up) ? (bcd_max) : (bcd_min);
assign co = en & fs;

endmodule