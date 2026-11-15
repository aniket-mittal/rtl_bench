module origen_018110(
    input enable,
    input clk,
    input reset,
    output reg [63:0] out
);

reg [31:0] out1;
wire linear_feedback;
reg [1:0] flit_type, flit_type1, flit_type2;
reg [7:0] destination_address;
reg [21:0] time_stamp;
reg [1:0] count;
integer g;

[MASKED]

always @(posedge clk or posedge reset) begin
    if (reset) begin
        out1 <= 32'h0;
        time_stamp <= 22'd10;
        out <= 64'h0;
        g <= 0;
    end else if (enable) begin
        out1 <= {out1[30:0], linear_feedback};
        time_stamp <= time_stamp + 1;
        
        case (g % 11)
            0: begin
                flit_type <= 2'b01;
                ;
            end
            1,2,3,4,5,6,7,8,9: begin
                flit_type1 <= 2'b00;
                ;
            end
            10: begin
                flit_type2 <= 2'b10;
                ;
            end
        endcase
        
        if (g % 11 == 0)
            out <= {flit_type, 8'h01, time_stamp, out1};
        else if (g % 11 == 10)
            out <= {flit_type2, 8'h01, time_stamp, out1};
        else
            out <= {flit_type1, 8'h01, time_stamp, out1};
        
        g <= g + 1;
        
        ;
    end
end

endmodule