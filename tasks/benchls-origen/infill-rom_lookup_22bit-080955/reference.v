module origen_080955 (
    input wire clk,
    input wire en,
    input wire [4:0] addr,
    output wire [21:0] dout
);

    parameter ROM_WID = 22;
    parameter ROM_DEP = 32;
    parameter ROM_ADDR = 5;

    reg [ROM_WID-1:0] data;

    always @(posedge clk) begin
        if (en) begin
            case (addr)
                5'd0:  data <= 22'h3fffff;
                5'd1:  data <= 22'h3ffffe;
                5'd2:  data <= 22'h3ffffd;
                5'd3:  data <= 22'h3ffffc;
                5'd4:  data <= 22'h3ffffb;
                5'd5:  data <= 22'h3ffffa;
                5'd6:  data <= 22'h3ffff9;
                5'd7:  data <= 22'h3ffff8;
                5'd8:  data <= 22'h000007;
                5'd9:  data <= 22'h000006;
                5'd10: data <= 22'h000005;
                5'd11: data <= 22'h000004;
                5'd12: data <= 22'h000003;
                5'd13: data <= 22'h000002;
                5'd14: data <= 22'h000001;
                5'd15: data <= 22'h000000;
                5'd16: data <= 22'h3fffff;
                5'd17: data <= 22'h3ffffe;
                5'd18: data <= 22'h3ffffd;
                5'd19: data <= 22'h3ffffc;
                5'd20: data <= 22'h3ffffb;
                5'd21: data <= 22'h3ffffa;
                5'd22: data <= 22'h3ffff9;
                5'd23: data <= 22'h3ffff8;
                5'd24: data <= 22'h000007;
                5'd25: data <= 22'h000006;
                5'd26: data <= 22'h000005;
                5'd27: data <= 22'h000004;
                5'd28: data <= 22'h000003;
                5'd29: data <= 22'h000002;
                5'd30: data <= 22'h000001;
                5'd31: data <= 22'h000000;
            endcase
        end
    end

    assign dout = data;

endmodule