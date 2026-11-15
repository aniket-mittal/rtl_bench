module rtlpp_10488(target_angle, clk, rst, x_res, y_res);

    input clk, rst;
    input signed [19:0] target_angle;
   
    output reg signed [19:0] x_res;
    output reg signed [19:0] y_res;
    
    reg signed [19:0] target_angle_clk;

    reg signed [19:0] x [9:0];
    reg signed [19:0] y [9:0];

    wire signed [19:0] arc_tan [8:0];
    reg signed [19:0] rotation_angle[8:0];
    reg rotation_direction[8:0];

    assign arc_tan[0] = 20'h00000;    //{{6{1'b0}},{10{1'b0}},{4{1'b0}}};
    assign arc_tan[1] = 20'h00B40;    //{{6{1'b0}},10'b0000101101,4'b0000};
    assign arc_tan[2] = 20'h00D29;    //{{6{1'b0}},10'b0000011010,4'b1001};
    assign arc_tan[3] = 20'h00E00;    //{{6{1'b0}},10'b0000001110,4'b0000};
    assign arc_tan[4] = 20'h00740;    //{{6{1'b0}},10'b0000000111,4'b0010};
    assign arc_tan[5] = 20'h003C9;    //{{6{1'b0}},10'b0000000011,4'b1001};
    assign arc_tan[6] = 20'h001C0;    //{{6{1'b0}},10'b0000000001,4'b1100};
    assign arc_tan[7] = 20'h000E0;    //{{6{1'b0}},10'b0000000000,4'b1110};
    assign arc_tan[8] = 20'h00079;    //{{6{1'b0}},10'b0000000000,4'b0111};

    always @(posedge clk) begin
        if (rst == 0) begin
            x_res <= 20'b0;
            y_res <= 20'b0;
        end else begin
            target_angle_clk <= target_angle;
            x_res <= x[9];
            y_res <= y[9];
        end
    end

    [MASKED]

endmodule