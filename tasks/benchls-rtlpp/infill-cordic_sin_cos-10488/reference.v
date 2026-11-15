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

    always @(*) begin
        x[0] = 20'h09B71; // 20'b00001001101101110001; 
        y[0] = 20'h00000; // 20'b00000000000000000000; 
        rotation_angle[0] = arc_tan[0];
        
        rotation_direction[0] = (rotation_angle[0] <= target_angle_clk) ? 1 : 0;
        x[1] = (rotation_direction[0] == 1) ? (x[0] - y[0]) : (x[0] + y[0]);
        y[1] = (rotation_direction[0] == 1) ? (y[0] + x[0]) : (y[0] - x[0]);
        rotation_angle[1] = (rotation_direction[0] == 1) ? (rotation_angle[0] + arc_tan[1]) : (rotation_angle[0] - arc_tan[1]);

        rotation_direction[1] = (rotation_angle[1] <= target_angle_clk) ? 1 : 0;
        x[2] = (rotation_direction[1] == 1) ? (x[1] - (y[1] >>> 1)) : (x[1] + (y[1] >>> 1));
        y[2] = (rotation_direction[1] == 1) ? (y[1] + (x[1] >>> 1)) : (y[1] - (x[1] >>> 1));
        rotation_angle[2] = (rotation_direction[1] == 1) ? (rotation_angle[1] + arc_tan[2]) : (rotation_angle[1] - arc_tan[2]);

        rotation_direction[2] = (rotation_angle[2] <= target_angle_clk) ? 1 : 0;
        x[3] = (rotation_direction[2] == 1) ? (x[2] - (y[2] >>> 2)) : (x[2] + (y[2] >>> 2));
        y[3] = (rotation_direction[2] == 1) ? (y[2] + (x[2] >>> 2)) : (y[2] - (x[2] >>> 2));
        rotation_angle[3] = (rotation_direction[2] == 1) ? (rotation_angle[2] + arc_tan[3]) : (rotation_angle[2] - arc_tan[3]);

        rotation_direction[3] = (rotation_angle[3] <= target_angle_clk) ? 1 : 0;
        x[4] = (rotation_direction[3] == 1) ? (x[3] - (y[3] >>> 3)) : (x[3] + (y[3] >>> 3));
        y[4] = (rotation_direction[3] == 1) ? (y[3] + (x[3] >>> 3)) : (y[3] - (x[3] >>> 3));
        rotation_angle[4] = (rotation_direction[3] == 1) ? (rotation_angle[3] + arc_tan[4]) : (rotation_angle[3] - arc_tan[4]);

        rotation_direction[4] = (rotation_angle[4] <= target_angle_clk) ? 1 : 0;
        x[5] = (rotation_direction[4] == 1) ? (x[4] - (y[4] >>> 4)) : (x[4] + (y[4] >>> 4));
        y[5] = (rotation_direction[4] == 1) ? (y[4] + (x[4] >>> 4)) : (y[4] - (x[4] >>> 4));
        rotation_angle[5] = (rotation_direction[4] == 1) ? (rotation_angle[4] + arc_tan[5]) : (rotation_angle[4] - arc_tan[5]);

        rotation_direction[5] = (rotation_angle[5] <= target_angle_clk) ? 1 : 0;
        x[6] = (rotation_direction[5] == 1) ? (x[5] - (y[5] >>> 5)) : (x[5] + (y[5] >>> 5));
        y[6] = (rotation_direction[5] == 1) ? (y[5] + (x[5] >>> 5)) : (y[5] - (x[5] >>> 5));
        rotation_angle[6] = (rotation_direction[5] == 1) ? (rotation_angle[5] + arc_tan[6]) : (rotation_angle[5] - arc_tan[6]);

        rotation_direction[6] = (rotation_angle[6] <= target_angle_clk) ? 1 : 0;
        x[7] = (rotation_direction[6] == 1) ? (x[6] - (y[6] >>> 6)) : (x[6] + (y[6] >>> 6));
        y[7] = (rotation_direction[6] == 1) ? (y[6] + (x[6] >>> 6)) : (y[6] - (x[6] >>> 6));
        rotation_angle[7] = (rotation_direction[6] == 1) ? (rotation_angle[6] + arc_tan[7]) : (rotation_angle[6] - arc_tan[7]);

        rotation_direction[7] = (rotation_angle[7] <= target_angle_clk) ? 1 : 0;
        x[8] = (rotation_direction[7] == 1) ? (x[7] - (y[7] >>> 7)) : (x[7] + (y[7] >>> 7));
        y[8] = (rotation_direction[7] == 1) ? (y[7] + (x[7] >>> 7)) : (y[7] - (x[7] >>> 7));
        rotation_angle[8] = (rotation_direction[7] == 1) ? (rotation_angle[7] + arc_tan[8]) : (rotation_angle[7] - arc_tan[8]);

        rotation_direction[8] = (rotation_angle[8] <= target_angle_clk) ? 1 : 0;
        x[9] = (rotation_direction[8] == 1) ? (x[8] - (y[8] >>> 8)) : (x[8] + (y[8] >>> 8));
        y[9] = (rotation_direction[8] == 1) ? (y[8] + (x[8] >>> 8)) : (y[8] - (x[8] >>> 8));
    end

endmodule